FactoryBot.define do
  factory :item do
    price {Faker::Number.within(range:300..9999999)}
    name {Faker::Beer.name}
    explanation {Faker::Lorem.paragraph}
    category_id {Faker::Number.between(from:2, to:11)}
    quality_id {Faker::Number.between(from:2, to:7)}
    delivery_fee_id {Faker::Number.between(from:2, to:3)}
    shipping_area_id {Faker::Number.between(from:2, to:48)}
    shipping_date_id {Faker::Number.between(from:2, to:4)}
    association :user
  end
end
