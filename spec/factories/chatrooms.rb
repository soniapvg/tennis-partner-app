FactoryBot.define do
  factory :chatroom do
    user_1  { FactoryBot.create(:user) } 
    user_2 { FactoryBot.create(:user) } 
  end
end
