class User < ApplicationRecord
  has_secure_password

  has_many :events
  has_many :comments

  validates :username, presence: true
  validates :username, uniqueness: true
end
