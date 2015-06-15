class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :channel, presence: true

  belongs_to :user
end
