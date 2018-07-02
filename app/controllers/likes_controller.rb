class LikesController < ApplicationController
  before_action :set_trade

  def create
    user_id = current_user.id
    @like = @trade.likes.where(user_id: user_id).first_or_create
    if @like.valid?
      @like.save
      redirect_to '/publicfeed'
    else
      redirect_to '/publicfeed'
    end
  end

  def destroy
    trade_id = params[:trade_id]
    user_id = current_user.id
    Like.where(user_id: user_id , trade_id: trade_id).delete_all
    redirect_to '/publicfeed'

  end

  private

  def set_trade
    @trade = Trade.find(params[:trade_id])
  end

end
