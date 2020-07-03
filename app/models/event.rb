class Event < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :name, :location, :image_url, :attendees, presence: true
end
