class User < ActiveRecord::Base
  validates :access_token, presence: true

  has_many :messages

  def to_param
    self.name.gsub(" ", "_")
  end
end
