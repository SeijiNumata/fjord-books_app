# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]
  validates :uid, uniqueness: { scope: :provider }

  # authの中身はGitHubから送られてくる大きなハッシュ。この中に名前やメアドなどが入っている。
  # providerカラムとuidカラムが送られてきたデータと一致するユーザーを探す。
  # もしユーザーが見つからない場合は新規作成する。
  def self.find_for_github_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      # 任意の20文字の文字列を作成する
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
end
