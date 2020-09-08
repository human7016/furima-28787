class UserOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures, :city, :address, :building, :phone_number 

  with_opthions presence: true do
    #purchase_historiesテーブルに保存する値
    validates :user_id
    validates :item_id
    #addressesテーブルに保存する値
    phone_number.gsub(/-/,'')
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures, numericality: { other_than: 1 }
    validates :city, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :address
    validates :building
    validates :phone_number, format:{with: /\A\d+[-]?\d+[-]?\d+\z/}
  end

  def save
    PurchaseHistory.create(user_id:current_user.id, item_id:@item.id)
    Address.create(postal_code:postal_code, prefectures:prefectures, city:city, address:address, building:building, phone_number:phone_number)
end