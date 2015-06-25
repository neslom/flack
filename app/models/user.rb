class User < ActiveRecord::Base
  validates :access_token, presence: true

  has_many :messages
end
