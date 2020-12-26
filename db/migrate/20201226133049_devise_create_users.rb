# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      ## データベースに保存されたパスワードが正しいか検 証。同時にパスワードの暗号化も行う。
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      ## パスワードをリセット
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      ## ログイン状態を維持
      t.datetime :remember_created_at

      ## Trackable
      ## ログインした回数、最終ログイン日時、前回ログイン日時、最終ログインIP、前回ログインIPを保存
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      ## 新規登録時にメール認証機能をつける
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      ## ログインに何度も失敗すると、アカウントをロック。
      ## 何回失敗するとロックするかはこのLockable内で指定
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
