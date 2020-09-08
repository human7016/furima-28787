class UserOrder

  include ActiveModel::Model
  attr_accessor 

  with_opthions presence: true do
    #purchase_historiesテーブルに保存する値
    validates :user_id, presence:true
    validates :item_id, presence:true
    #addressesテーブルに保存する値
    phone_number.gsub(/-/,'')
    validates :postal_code, presence:true ,format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures, presence:true
    validates :city, presence:true, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :address, presence:true
    validates :building
    validates :phone_number, presence:true, format:{with: /\A\d+[-]?\d+[-]?\d+\z/}
  end
end