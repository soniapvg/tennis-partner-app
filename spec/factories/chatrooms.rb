FactoryBot.define do
  factory :chatroom do
    user1  { FactoryBot.create(:user) } 
    user2 { FactoryBot.create(:user) }
  end
end
