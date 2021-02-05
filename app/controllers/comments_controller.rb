# frozen_string_literal: true

class CommentsController < ApplicationController
   before_action :set_commentable, only: %i[create]
  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      flash[:notice] = t('controllers.common.notice_create', name: Comment.model_name.human)
      redirect_to @commentable
    else
      redirect_to :back, flash: {
        comment: @comment, error_messages: @comment.errors.full_messages
      }
    end
  end
end

def comment_params
  params.require(:comment).permit(:commentable_type, :commentable_id, :body).merge(user_id: current_user.id)
end
