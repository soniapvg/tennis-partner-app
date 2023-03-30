FactoryBot.define do
  ActionMailer::Base.perform_deliveries = false

  factory :chatroom do
    user1  { FactoryBot.create(:user) } 
    user2 { FactoryBot.create(:user) }
  end
end
