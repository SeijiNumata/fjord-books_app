# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  

  def following
    @user  = User.find(params[:id])
    @users = @user.following
 end

 def followers
  @user  = User.find(params[:id])
  puts "龍#{@user}"
  @users = @user.followers
end

end
