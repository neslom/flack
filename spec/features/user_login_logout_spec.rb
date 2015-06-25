require "rails_helper"
require "./spec/support/user_login.rb"

RSpec.describe "User login and logout" do
  scenario "user can login with soundcloud" do
    expect do
      login_with_soundcloud
    end.to change { User.count }.from(0).to(1)
  end
end
