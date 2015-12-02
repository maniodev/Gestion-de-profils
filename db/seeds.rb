# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Profile.destroy_all

10.times do
  Profile.create!({
    nom: Faker::Name.last_name,
    prenom: Faker::Name.first_name ,
    address: "#{Faker::Address.street_address} #{Faker::Address.street_name} #{Faker::Address.city}",
    dob: Faker::Date.backward(14),
    about: Faker::Hipster.paragraph
  })  
end
