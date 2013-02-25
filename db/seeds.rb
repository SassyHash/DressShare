# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "egsample@dartmouth.edu", first_name: "Brittany", last_name: "Yoon")
User.create(email: "renter@dartmouth.edu", first_name: "B", last_name: "Y")
LABELS = ["Petite", "Athletic", "Lean", "Busty", "Pear", "Tall", "Hourglass", "Tummy-Shaping", "Curvy", "Conservative"]
  LABELS.each { |label| BodyType.create(label: label) }
Dress.create(brand: "Marchesa", size: 4, color: "peach", owner_id: 1)
Dress.create(brand: "Chanel", size: 4, color: "white", owner_id: 1)
Dress.create(brand: "Forever 21", size: 2, color: "peach", owner_id: 2)
BodyTypeDress.create(dress_id: 1, body_type_id: 1)
BodyTypeDress.create(dress_id: 1, body_type_id: 2)
BodyTypeDress.create(dress_id: 2, body_type_id: 3)
BodyTypeDress.create(dress_id: 3, body_type_id: 1)