class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:error] = "You must be logged in to access this area!"
      redirect_to root_path
    end
  end
end
