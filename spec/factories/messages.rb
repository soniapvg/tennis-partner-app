FactoryBot.define do
  factory :message do
    chatroom { FactoryBot.create(:chatroom) }  
    receiver { chatroom.user1 }
    sender { chatroom.user2 }
    content { Faker::Lorem.paragraph }
  end
end
