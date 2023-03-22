# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

1.times do 
  admin = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    email: 'administrator' + '@yopmail.com',
    password: "123456789",
    date_of_birth: Faker::Date.between(from: 70.years.ago, to: 18.years.ago),
    gender: Faker::Number.between(from: 1, to: 3),
    experience: Faker::Number.between(from: 1, to: 24),
    week_day: Faker::Boolean.boolean,
    week_night: Faker::Boolean.boolean,
    weekend_day: Faker::Boolean.boolean,
    weekend_night: Faker::Boolean.boolean
  )
end
10.times do 
  admin = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    email: Faker::Lorem.word + '@yopmail.com',
    password: "123456789",
    date_of_birth: Faker::Date.between(from: 70.years.ago, to: 16.years.ago),
    gender: Faker::Number.between(from: 1, to: 3),
    experience: Faker::Number.between(from: 1, to: 24),
    week_day: Faker::Boolean.boolean,
    week_night: Faker::Boolean.boolean,
    weekend_day: Faker::Boolean.boolean,
    weekend_night: Faker::Boolean.boolean
  )
end