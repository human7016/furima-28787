FactoryBot.define do
  factory :item do
    id { Faker::Number.between(from: 1, to: 100) }
    price { Faker::Number.within(range: 300..9_999_999) }
    name { Faker::Beer.name }
    explanation { Faker::Lorem.paragraph }
    category_id { Faker::Number.between(from: 2, to: 11) }
    quality_id { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
