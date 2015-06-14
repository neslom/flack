require "rails_helper"
require "./spec/support/user_login.rb"

RSpec.describe "User login and logout" do
  let!(:user) { User.create(name: "Markus",
                           email: "molsen13@gmail.com",
                           password: "password") }

  scenario "existing user logs in" do
    visit root_path

    within(".navbar-collapse") do
      click_link_or_button("Sign in")
    end

    fill_in("session[email]", with: user.email)
    fill_in("session[password]", with: "password")
    within(".login") do
      click_link_or_button("Sign In")
    end

    expect(current_path).to eq(user_path(user))

    within(".flash") do
      expect(page).to have_content("Markus")
    end
  end

  scenario "logged in User can logout" do
    login_as(user)
    expect(current_path).to eq(user_path(user))
  end
end
