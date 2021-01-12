# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

<<<<<<< HEAD
  def update_resource(resource, params)
    resource.update_without_password(params)
=======
  # Override
  def update_resource(resource, params)
    if params[:password].blank?
      # パスワード変更を伴わない場合はオーバーライドする
      # current_passwordが残っていると、これを更新しようとしてエラーになるのでparamsから削除
      params.delete(:current_password)
      resource.update_without_password(params)
    else
      # パスワード変更を伴う場合はデフォルトの実装を使う
      super
    end
>>>>>>> 2ca1e533980e3d2cb229ef0c9d15398281e1ded7
  end
end
