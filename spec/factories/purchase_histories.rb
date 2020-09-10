FactoryBot.define do
  factory :purchase_history do
    association :item
    association :user
  end
end
