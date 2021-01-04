# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroying"
# User.destroy_all
# Review.destroy_all
Place.destroy_all


puts "Creating Users 👨‍👨‍👧‍👦"
20.times do 
  User.create(name: Faker::FunnyName.name, username: Faker::Music::RockBand.name)
end 