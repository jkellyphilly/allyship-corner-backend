class Event < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :event_attendees
  has_many :attendees, through: :event_attendees

  validates :name, :location, :image_url, :attendees, presence: true
end
