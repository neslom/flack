require "rails_helper"

RSpec.describe User do
  let!(:user) { User.create(name: "Markus",
                            access_token: "asdfpi3839") }

  context "is invalid" do
    it" without an access token" do
      user2 = User.new(name: "markus",
                       access_token: "")

      expect(user2).to_not be_valid
    end
  end

  context "is valid" do
    it "returns a collection of messages" do
      3.times do
        user.messages.create(body: "i'm the body", channel: "main")
      end

      expect(user.messages.length).to eq(3)
      expect(user.messages.first.body).to eq("i'm the body")
    end
  end
end
