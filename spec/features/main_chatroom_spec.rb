require "rails_helper"
require "./spec/support/user_login.rb"

RSpec.describe "Initial chat room" do
  let!(:user) do
    User.create(name: "Markus",
                email: "molsen13@gmail.com",
                password: "password")
  end

  scenario "user can post messages in chat room", js: true do
    login_as(user)

    fill_in("message[body]", with: "message stuff")
    click_link_or_button("Chat")

    within(".messages.main") do
      expect(page).to have_content("message stuff")
    end
  end

  scenario "user sees last five messages when entering the main chat room", js: true do
    messages = []
    5.times do |n|
      message = Message.create(body: "message number #{n}",
                               channel: "main",
                               user_id: user.id
                              )
      messages.push(message)
    end

    login_as(user)

    messages.each do |message|
      within(".messages") { expect(page).to have_content(message.body) }
    end
  end

  scenario "User One can see a message posted by User two", js: true do
    user2 = User.create(name: "Richard",
                        email: "richard@example.com",
                        password: "password"
                       )
    login_as(user)
    fill_in("message[body]", with: "message stuff")
    click_link_or_button("Chat")

    login_as(user2)

    expect(page).to have_content("message stuff")
  end
end
