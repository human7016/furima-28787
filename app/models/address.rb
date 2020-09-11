class Address < ApplicationRecord
  # Association
  belongs_to :purchase_history

  # validates
  with_options presence:true do
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :address
    validates :phone_number, format:{with: /\A\d{10,11}\z/}
  end
end
