require "rails_helper"
require "./spec/support/user_login.rb"

RSpec.describe "Initial chat room" do
  let!(:user) do
    User.create(name: "Markus",
                email: "molsen13@gmail.com",
                password: "password")
  end

  scenario "user can post messages in chat room" do
    login_as(user)

    fill_in("message[body]", with: "message stuff")
    click_link_or_button("Chat")

    within(".messages") do
      expect(page).to have_content("message stuff")
    end
  end
end
