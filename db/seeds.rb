# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(email: "egsample@dartmouth.edu", first_name: "Brittany", last_name: "Yoon", password: "password", password_confirmation: "password" )
user.save

renter = User.new(email: "renter@dartmouth.edu", first_name: "B", last_name: "Y", password: "passwordy", password_confirmation: "passwordy")
renter.save

LABELS = ["Petite", "Athletic", "Lean", "Busty", "Pear", "Tall", "Hourglass", "Tummy-Shaping", "Curvy", "Conservative"]
  LABELS.each { |label| BodyType.create(label: label) }

