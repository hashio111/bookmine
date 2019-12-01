FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { "00000000" }
    password_confirmation { "00000000" }
  end
end
