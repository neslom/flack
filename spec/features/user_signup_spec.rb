require "rails_helper"

RSpec.describe "User sign up" do
  scenario "User can sign up" do
    visit root_path

    click_link_or_button("Sign up")
    fill_in("session[username]", with: "Markus")
    fill_in("session[email]", with: "molsen13@gmail.com")
    fill_in("session[password]", with: "password")
    fill_in("session[password_confirmation]", with: "password")

    within(".flash") do
      expect(page).to have_content("Welcome, Markus!")
    end
  end
end
