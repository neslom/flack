require "rails_helper"
require "./spec/support/user_login.rb"

RSpec.describe "Multiple chat rooms" do
  let!(:user) do User.create(name: "Markus",
                             email: "molsen13@gmail.com",
                             password: "password"
                            )
  end

  scenario "user visits chat other than main and does not see main's messages", js: true do
    login_as(user)

    fill_in("message[body]", with: "message stuff")
    click_link_or_button("Chat")

    within(".messages.main") do
      expect(page).to have_content("message stuff")
    end

    click_link_or_button("Rock")

    expect(current_path).to eq(rock_path)

    within(".messages.rock") do
      expect(page).to_not have_content("message stuff")
    end

    fill_in("message[body]", with: "rock rules")
    click_link_or_button("Chat")

    within(".messages.rock") do
      expect(page).to have_content("rock rules")
    end

    click_link_or_button("Main")

    expect(current_path).to eq(main_chat_path)

    within(".messages.main") do
      expect(page).to have_content("message stuff")
      expect(page).to_not have_content("rock rules")
    end
  end
end
