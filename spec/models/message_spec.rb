require "rails_helper"

RSpec.describe Message do
  context "is valid if" do
    it "has a body and a channel" do
      message = Message.create(body: "message body", channel: "main")

      expect(message.body).to eq("message body")
      expect(message.channel).to eq("main")
    end
  end

  context "is invalid if" do
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
end
