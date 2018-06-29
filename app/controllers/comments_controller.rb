class CommentsController < ApplicationController
  
      def create

            user_session = session[:user_id]
            if user_session
                trade_id = params[:trade_id]
                comment = params[:comment]
                check_comment = Comment.new(user_id: user_session, trade_id: trade_id, user_comment: comment)
                if check_comment.valid?
                    check_comment.save
                else
                    flash[:notice]="Please write a comment"
                end
                redirect_to '/publicfeed'   
            else
                redirect_to '/'
                flash[:notice] = "Please login to comment"
            end

      end   

end
