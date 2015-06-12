require "rails_helper"

RSpec.describe "User sign up" do
  scenario "User can sign up" do
    visit root_path

    click_link_or_button("Sign up")

    expect(current_path).to eq(signup_path)
    fill_in("user[name]", with: "Markus")
    fill_in("user[email]", with: "molsen13@gmail.com")
    fill_in("user[password]", with: "password")
    fill_in("user[password_confirmation]", with: "password")

    within(".flash") do
      expect(page).to have_content("Welcome, Markus!")
    end
  end
end
