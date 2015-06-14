require "rails_helper"

RSpec.describe "User login" do
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
end
