# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = t('controllers.follow.following.success')
    else
      flash.now[:alert] = t('controllers.follow.following.alert')
    end
    redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = t('controllers.follow.unfollow.success')
    else
      flash.now[:alert] = t('controllers.follow.unfollow.alert')
    end
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
