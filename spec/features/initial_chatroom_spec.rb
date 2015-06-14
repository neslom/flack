require "rails_helper"

RSpec.describe "Initial chat room" do
  let!(:user) do
    User.create(name: "Markus",
                email: "molsen13@gmail.com",
                password: "password")
  end

  scenario "user can post messages in chat room" do
    login_as(user)

    fill_in("message[body]", with: "message stuff")
    within(".chat") do
      expect(page).to have_content("message stuff")
    end
  end
end
