class SessionsController < ApplicationController
  skip_before_filter :must_be_logged_in!

  def new
    redirect_to $client.authorize_url()
  end

  def create
    access_token = $client.exchange_token(code: params[:code]).access_token
    user = User.find_or_create_by(access_token: access_token)
    soundcloud_user = $client.get('/me')
    user.update_attributes(name: soundcloud_user.username)

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}"
      redirect_to main_chat_path
    else
      flash[:danger] = "Invalid login attempt"
      redirect_to login_path
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    session[:user_id] = nil
    flash[:notice] = "Goodbye, #{user.name}!" if user
    redirect_to root_path
  end
end
