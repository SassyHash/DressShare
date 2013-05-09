# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LABELS = ["Petite", "Athletic", "Lean", "Busty", "Pear", "Tall", "Hourglass", "Tummy-Shaping", "Curvy", "Conservative"]
  LABELS.each { |label| BodyType.create(label: label) }

School.create(:town => "Hanover", :state => "NH", :domain =>"dartmouth.edu", :name => "Dartmouth College");
	School.create(:town => "Lakeville", :state => "CT", :domain =>"hotchkiss.org", :name => "Hotchkiss School");
School.create(:town => "Middlebury", :state => "VT", :domain =>"middlebury.edu", :name => "Middlebury College");
School.create(:town => "Berkeley", :state => "CA", :domain =>"berkeley.edu", :name => "UC Berkeley");