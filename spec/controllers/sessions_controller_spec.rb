require "rails_helper"
require "./spec/support/user_login.rb"

RSpec.describe SessionsController do
  it "clears the session when a user logs out" do
    login_with_soundcloud
    session[:user_id] = ApplicationController.new.current_user.id

    delete :destroy

    expect(session[:user_id]).to eq(nil)
  end
end
