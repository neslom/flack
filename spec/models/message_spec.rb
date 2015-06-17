require "rails_helper"

RSpec.describe Message do
  context "valid" do
    it "has a body and a channel" do
      message = Message.create(body: "message body", channel: "main")

      expect(message.body).to eq("message body")
      expect(message.channel).to eq("main")
    end
  end

  context "invalid" do
    it "does not have a body" do
      expect do
        Message.create!(body: "", channel: "main")
      end.to raise_error(ActiveRecord::RecordInvalid, /Body can't be blank/)
    end

    it "does not have a channel" do
      expect do
        Message.create!(body: "message body", channel: "")
      end.to raise_error(ActiveRecord::RecordInvalid, /Channel can't be blank/)
    end
  end

  describe ".last_five_main_chat_messages" do
    it "returns the last five chat messages in custom json format" do
      user = User.create(name: "markus",
                         email: "molsen13@gmail.com",
                         password: "password"
                        )

      7.times do |n|
        user.messages.create(body: "message number #{n}",
                             channel: "main"
                            )
      end

      expect(Message.last_five_main_chat_messages.count).to eq(5)
      expect(Message.last_five_main_chat_messages).to_not include(Message.first)
      expect(Message.last_five_main_chat_messages).to_not include(Message.second)
    end
  end

  describe "#custom_json(user)" do
    it "returns custom json with the original message as well as the user" do
      user = User.create(name: "markus",
                           email: "molsen13@gmail.com",
                           password: "password"
                          )
      message = user.messages.create(body: "message body",
                                     channel: "main"
                                    )
      expected_message = { message: message, user: user.name }.to_json

      expect(message.custom_json(user)).to eq(expected_message)
    end
  end
end
