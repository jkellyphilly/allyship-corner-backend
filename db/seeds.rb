# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

new_event = Event.create(name: "Black Lives Matter Philly Protest", location: "City Hall, Philadelphia, PA",
  image_url: "data:image/jpeg;base64,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")

second_new_event = Event.create(name: "Community arts and crafts for Pride Month!", location: "571 W Spencer St, Philadelphia, PA 19120", 
  image_url: "data:image/jpeg;base64,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")
