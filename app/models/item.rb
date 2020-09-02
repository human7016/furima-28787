class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  validates :user, :image, :name, :explanation, :price, :category, :quality, :delivery_fee, :shipping_area, :shipping_date, presence:true

  validates :category, numericality:{other_than:1}
  validates :quality, numericality:{other_tahn:1}
  validates :delivery_fee, numericality:{other_tahn:1}
  validates :shipping_area, numericality:{other_than:1}
  validates :shipping_date, numericality:{other_tahn:1}
end
