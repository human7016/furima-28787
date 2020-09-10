class Address < ApplicationRecord
  # Association
  belongs_to :purchase_history

  # validates
  with_options presence:true do
    validates :purchase_history_id
    validates :postal_code
    validates :prefectures_id
    validates :city
    validates :address
    validates :phone_number
  end
end
