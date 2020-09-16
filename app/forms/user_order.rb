class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    # purchase_historiesテーブルに保存する値(user_idはパラメータに入ってないのでバリデーションを加えない)
    validates :item_id
    # addressesテーブルに保存する値
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    # 購入履歴を保存
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    # 住所情報を保存
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
