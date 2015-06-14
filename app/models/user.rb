class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  has_secure_password

  def to_param
    self.name.gsub(" ", "_")
  end
end
