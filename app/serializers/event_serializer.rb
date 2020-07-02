class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :attendees, :location, :comments, :user
end
