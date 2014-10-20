require 'faker'  

User.create(first_name: Faker::Name.first_name, city: cities.first)
