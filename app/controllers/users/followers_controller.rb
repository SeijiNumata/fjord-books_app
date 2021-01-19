# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @user  = User.find(params[:user_id])
    @users = @user.followers.order(id: :desc).page(params[:page])
  end
end
