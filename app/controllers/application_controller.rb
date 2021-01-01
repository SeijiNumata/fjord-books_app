# frozen_string_literal: true

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,:postal_code,:address,:introduce_yourself])
end
def after_sign_in_path_for(resource)
  books_path
end

def after_sign_out_path_for(resource)
  books_path
end

end
