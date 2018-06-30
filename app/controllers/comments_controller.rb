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

end
