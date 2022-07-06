FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "somepassword" }
    password_confirmation { "somepassword"}
  end
end
