# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Message.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('messages')
Invitation.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('invitations')
Chatroom.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('chatrooms')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')


1.times do 
  admin = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    email: 'administrator' + '@yopmail.com',
    password: "123456",
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
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    email: Faker::Internet.unique.username(specifier: 8) + '@yopmail.com',
    password: "123456",
    date_of_birth: Faker::Date.between(from: 70.years.ago, to: 16.years.ago),
    gender: Faker::Number.between(from: 1, to: 3),
    experience: Faker::Number.between(from: 1, to: 24),
    week_day: Faker::Boolean.boolean,
    week_night: Faker::Boolean.boolean,
    weekend_day: Faker::Boolean.boolean,
    weekend_night: Faker::Boolean.boolean
  )
end
puts "11 users générés administrator@yopmail.com mdp:123456 code_club:tcstjulien74"
# Create 10 unique pairs of userid for chatroom generations
pairs = []

while pairs.length < 10
  pair = [rand(1..11), rand(1..11)]
  next if pair[0] == pair[1] || pairs.include?(pair.sort)
  pairs << pair.sort
end
puts "paires générés"

#Create a chatroom with an invitation and messages for each pair 
pairs.each{ |pair|  
  chatroom = Chatroom.create!(
    user1: User.where(id:pair[0]).first,
    user2: User.where(id:pair[1]).first
  )

  # Create an invitation for each chatroom
  Invitation.create!(
    chatroom: chatroom,
    content: Faker::Lorem.paragraph,
    sender: chatroom.users.first,
    receiver: chatroom.users.second
  )
  Invitation.create!(
    chatroom: chatroom,
    content: Faker::Lorem.paragraph,
    sender: chatroom.users.second,
    receiver: chatroom.users.first
  )
  # Create 5 messages for each chatroom
  2.times do
    Message.create!(
      content: Faker::Lorem.paragraph,
      chatroom: chatroom,
      sender: chatroom.users.first,
      receiver: chatroom.users.second
    )
  end
  2.times do
    Message.create!(
      content: Faker::Lorem.paragraph,
      chatroom: chatroom,
      sender: chatroom.users.second,
      receiver: chatroom.users.first
    )    
  end
}
puts "chatrooms générés"