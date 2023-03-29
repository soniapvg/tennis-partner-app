FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    description { Faker::Hipster.paragraph }
    password { "123456" }
    gender {Faker::Number.between(from: 1, to: 3)}
    experience {Faker::Number.between(from: 1, to: 24)}
    week_day {Faker::Boolean.boolean}
    week_night {Faker::Boolean.boolean}
    weekend_day {Faker::Boolean.boolean}
    weekend_night {Faker::Boolean.boolean}
    outside {Faker::Boolean.boolean}
  end
end
