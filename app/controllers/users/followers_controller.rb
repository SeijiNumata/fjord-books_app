class Users::FollowersController < ApplicationController
  def index
    @user  = User.find(params[:user_id])
    @users = @user.followers
  end
end
