# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # request.env["omniauth.auth"]にGitHubから送られてきたデータが入っている
    @user = User.find_for_github_oauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
    set_flash_message(:notice, :success, kind: 'Github')
  end
end
