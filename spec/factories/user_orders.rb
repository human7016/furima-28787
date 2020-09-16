FactoryBot.define do
  factory :user_order do
    # PurchaseHistoryに関するFactoryBot
    item_id { FactoryBot.build(:item).id }
    user_id { FactoryBot.build(:user).id }
    # Addressに関するFactoryBot
    postal_code = "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}"
    postal_code { postal_code }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    city { Gimei.address.city.kanji }
    address { Faker::Address.street_address }
    building { Faker::Company.name }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    #モデルに保存しないもの
    token { Faker::Lorem.characters(number: 10) }
  end
end
