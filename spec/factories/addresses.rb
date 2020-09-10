FactoryBot.define do
  factory :address do
    association :purchase_history
    postal_code {Faker::Address.postcode}
    prefectures_id {Faker::Number.between(from:2, to:48)}
    city {Gimei.address.city.kanji}
    address {Faker::Address.street_address}
    building {Faker::Company.name}
    phone_number {Faker::Number.leading_zero_number(digits:11)}
  end
end
