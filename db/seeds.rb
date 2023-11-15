# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
puts "CLEANING DATABASE"
Restaurant.destroy_all
puts "DATABASE CLEAN"

puts "CREATING NEW RESTAURANTS"

5.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  phone_number = Faker::PhoneNumber.phone_number

  restaurant = Restaurant.create(name: name, address: address, category: category, phone_number: phone_number)
end

puts "DONE CREATING RESTAURANTS"
