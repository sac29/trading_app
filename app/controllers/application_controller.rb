class ApplicationController < ActionController::Base
  def current_user
    # find user from session user id
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_login
    redirect_to '/', alert: "Not authorized" if current_user.nil?
  end

end
