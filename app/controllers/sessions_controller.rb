class SessionsController < ApplicationController
    layout "application"
      def index
          
      end
      
      def create
        if login_params[:username]!=''
            user = User.find_or_create_by(username: login_params[:username] )
            if user.valid?
               session[:user_id]=user.id
               redirect_to '/trades'
            else
               redirect_to '/'
            end
           
        else
            redirect_to '/'  
        end

      end
      
      def destroy
            reset_session
            flash[:notice] = 'You have successfully logged out.'
            redirect_to '/'
      end
      

      private
         def login_params
            params.require(:login).permit(:username)
         end

end
