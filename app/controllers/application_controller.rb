class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :must_be_logged_in!

  def must_be_logged_in!
    if !logged_in?
      flash[:danger] = "You must login first"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private

  def logged_in?
    !!current_user
  end
end
