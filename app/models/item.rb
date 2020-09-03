class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  validates :user, :image, :name, :explanation, :price, :category, :quality, :delivery_fee, :shipping_area, :shipping_date, presence:true
  validates :price, numericality:{greater_than_or_equal_to:300, less_than:10000000}, format:{with:/\d/}

  validates :category_id, numericality:{other_than:1}
  validates :quality_id, numericality:{other_tahn:1}
  validates :delivery_fee_id, numericality:{other_tahn:1}
  validates :shipping_area_id, numericality:{other_than:1}
  validates :shipping_date_id, numericality:{other_tahn:1}
end
