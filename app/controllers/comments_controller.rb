class CommentsController < ApplicationController
  layout "application"

  before_action :require_login

  def create
    user_id = session[:user_id]
    trade_id = params[:trade_id]
    comment = params[:comment]
    comment = Comment.new(user_id: user_id, trade_id: trade_id, user_comment: comment)
    if comment.valid?
      comment.save
    else
      flash[:notice] = "Please write a comment"
    end
    redirect_to '/publicfeed'

  end

  def destroy
    comment_id = params[:id]
    user_id = current_user.id
    comment = Comment.includes(:user).includes(:trade =>  :user).where(id: comment_id).first
    if current_user.id == comment.user.id || current_user.id == comment.trade.user.id
      comment.destroy
      flash[:delete_comment] = "Comment deleted"
    else
      flash[:delete_comment] = "You can only delete your comments or comments on your post"
    end
    redirect_to '/publicfeed'
  end

end
