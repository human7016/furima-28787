class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Association
  belongs_to :user
  has_one    :purchase_history
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  # validates
  with_options presence: true do
    validates :user_id, :image, :name, :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }, format: { with: /\d/ }
    validates :category_id, numericality: { other_than: 1 }
    validates :quality_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_date_id, numericality: { other_than: 1 }
  end
end
