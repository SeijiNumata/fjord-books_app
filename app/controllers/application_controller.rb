# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name postal_code address introduce_yourself])
  end

  def after_sign_in_path_for(_resource)
    books_path
  end
end
