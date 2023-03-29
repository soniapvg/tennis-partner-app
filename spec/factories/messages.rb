FactoryBot.define do
  factory :message do
    chatroom { FactoryBot.create(:chatroom) } 
    sender { chatroom.user_1 } 
    receiver { chatroom.user_2 } 
    content { Faker::Lorem.paragraph }
  end
end
