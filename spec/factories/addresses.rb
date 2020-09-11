FactoryBot.define do
  factory :address do
    association :purchase_history
    #郵便番号のバリデーションに一致する文字列を変数postal_codeに代入
    postal_code = "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}"
    postal_code {postal_code}
    prefectures_id {Faker::Number.between(from:2, to:48)}
    city {Gimei.address.city.kanji}
    address {Faker::Address.street_address}
    building {Faker::Company.name}
    phone_number {Faker::Number.leading_zero_number(digits:11)}
  end
end
