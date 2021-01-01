# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show; end

  def index
    @users = User.order(:id).page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

   def after_update_path_for(_resource)
    books_path
  end

  def after_sign_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    books_path
  end
  
  def after_update_path_for(resource)
    books_path
  end
end
