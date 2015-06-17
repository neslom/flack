class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :channel, presence: true

  belongs_to :user

  def self.last_five_main_chat_messages
    where(channel: "main").last(5)
  end
end
