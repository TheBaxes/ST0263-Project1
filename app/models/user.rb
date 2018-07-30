class User < ApplicationRecord
  has_many :locations

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  has_secure_password
end
