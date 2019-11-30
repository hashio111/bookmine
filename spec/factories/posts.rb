FactoryBot.define do
  factory :post do
    title { 'テスト' }
    rate { '3' }
    content { 'テスト' }
    association :user
    association :product
  end
end
