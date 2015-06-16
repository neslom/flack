require "rails_helper"

RSpec.describe User do
  let!(:user) { User.create(name: "Markus",
                            email: "molsen13@gmail.com",
                            password: "password") }
  context "is invalid" do
    it "without name" do
      expect(User.new(name: "",
                      email: "molsen13@gmail.com",
                      password: "password")).to be_invalid
    end

    it "without email" do
      expect(User.new(name: "Markus",
                      email: "",
                      password: "password")).to be_invalid
    end

    it "with taken email" do
      expect do
        User.create!(name: "bob",
                     email: "molsen13@gmail.com",
                     password: "password")
      end.to raise_error(ActiveRecord::RecordInvalid, /Email has already been taken/)
    end

    it "with taken name" do
      expect do
        User.create!(name: "Markus",
                     email: "molsen111@gmail.com",
                     password: "password")
      end.to raise_error(ActiveRecord::RecordInvalid, /Name has already been taken/)
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
