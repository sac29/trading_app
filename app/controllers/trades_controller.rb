class TradesController < ApplicationController
  layout "application"

  before_action :require_login
  before_action :set_trade, only: [:create_like, :destroy_like]

  def index
    @user_trades = Trade.where(user_id: session[:user_id]).order(created_at: :desc)
    user = User.where(id: current_user.id).select("username")
  end


  def create
    user_id = session[:user_id]
    stock_name = trades_params[:stock_name]
    stock_price = trades_params[:stock_price]
    no_of_shares = trades_params[:no_of_shares]
    order_type = trades_params[:order_type]
    trade = Trade.create(stock_name: stock_name, stock_price: stock_price, user_id: user_id, no_of_shares: no_of_shares, order_type: order_type)
    if trade.valid?
      flash[:notice] = 'You have successfully saved the stock'
      redirect_to '/trades'
    else
      redirect_to '/'
    end

  end

  def get_public_feed
    # TODO: add pagination, using from and size
    #@public_feed = Trade.all.order(created_at: :desc)
    offset = params.has_key?(:from) && params[:from].to_i > 0 ? params[:from].to_i : 0
    limit = params.has_key?(:limit) && params[:limit].to_i > 0 ? params[:limit].to_i : 5
    public_feed = Trade.order(created_at: :desc).includes(:user, :comments => :user, :likes => :user).all
    @public_feed = public_feed.limit(limit).offset(offset)
    @trades_size = public_feed.size
  end

  private

  def trades_params
    params.require(:trades).permit(:stock_name, :stock_price, :no_of_shares, :order_type)
  end


end
