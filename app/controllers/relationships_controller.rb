class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = t('controllers.follow.following.success')
      redirect_to @user
    else
      flash.now[:alert] = t('controllers.follow.following.alert')
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = t('controllers.follow.unfollow.success')
      redirect_to @user
    else
      flash.now[:alert] = t('controllers.follow.following.alert')
      redirect_to @user
    end
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end

end
