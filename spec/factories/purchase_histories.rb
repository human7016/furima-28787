FactoryBot.define do
  factory :purchase_history do
    id { Faker::Number.between(from: 1, to: 100) }
    association :item
    association :user
  end
end
