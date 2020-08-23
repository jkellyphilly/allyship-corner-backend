class Attendee < ApplicationRecord
  belongs_to :user
  has_many :event_attendees
  has_many :events, through: :event_attendees
end
