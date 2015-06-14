class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else
      flash[:danger] = "Invalid login attempt"
      redirect_to login_path
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    session[:user_id] = nil
    flash[:notice] = "Goodbye, #{user.name}!"
    redirect_to root_path
  end
end
