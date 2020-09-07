class Address < ApplicationRecord
  validates :postal_code, presence:true ,format:{with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefectures, presence:true
  validates :city, presence:true, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :address, presence:true
  validates :building
  validates :phone_number, presence:true, format:{with: /\A\d+[-]?\d+[-]?\d+\z/}
  #電話番号はハイフンなしで保存
  phone_number.gsub(/-/,'')
end
