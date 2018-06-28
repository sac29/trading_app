class TradesController < ApplicationController
    layout "application"

    def index
        if session[:user_id]
        @user_trades = Trade.where(user_id: session[:user_id]).order(created_at: :desc) 
        else
            flash[:notice]  = 'Please login to view public feed' 
            redirect_to '/'
        end

    end
     
    def show   
    end

    def create 
        user_session = session[:user_id]
        if user_session
            company_name = trades_params[:stock_name]
            stock_price_company = trades_params[:stock_price]
            no_of_shares_company = trades_params[:no_of_shares]
            buy_sell = trades_params[:order_type]
              
            trades = Trade.create(stock_name: company_name, stock_price: stock_price_company, user_id: user_session, no_of_shares: no_of_shares_company, order_type: buy_sell )
            
            if trades.valid?
                flash[:notice] = 'You have successfully saved the stock'
                redirect_to '/saved'
            else
                redirect_to '/'
            end
        else

        end 
    
    end
    
     def get_public_feed
        if session[:user_id]
            @public_feed = Trade.all.includes(:user).to_a
        else
           flash[:notice]  = 'Please login to view public feed' 
           redirect_to '/'
        end
     end

     private
         def trades_params
           params.require(:trades).permit(:stock_name, :stock_price, :no_of_shares, :order_type) 
         end
   
end
