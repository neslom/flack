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
      end.to raise_error( ActiveRecord::RecordInvalid, /Email has already been taken/)
    end

    it "with taken name" do
      expect do
        User.create!(name: "Markus",
                     email: "molsen111@gmail.com",
                     password: "password")
      end.to raise_error( ActiveRecord::RecordInvalid, /Name has already been taken/)
    end
  end
end
