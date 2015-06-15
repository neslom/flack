require "rails_helper"

RSpec.describe Message do
  context "is valid" do
    it "has a body and a channel" do
      message = Message.create(body: "message body", channel: "main")

      expect(message.body).to eq("message body")
      expect(message.channel).to eq("main")
    end
  end
end
