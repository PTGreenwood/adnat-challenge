# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

organisations = [
  [ "Bob's Building", 10 ],
  [ "Franks Fruit", 22 ],
  [ "Billy's Books", 7.58 ],
  [ "My Weather Station", 8 ],
  [ "Freedom Organisation", 10 ],
  [ "Another Organisation", 9.34 ]
]

organisations.each do |name, hourly_rate|
    Organisation.create( name: name, hourly_rate: hourly_rate )
  end