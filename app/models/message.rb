class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :channel, presence: true

  belongs_to :user

  def self.last_five_main_chat_messages
    where(channel: "main").last(5).map { |message| message.custom_json(message.user) }
  end

  def custom_json(user)
    { message: self, user: user.name }.to_json
  end
end
