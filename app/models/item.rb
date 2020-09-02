class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :quality

  validates :category, numericality:{other_than:1}
  validates :quality, numericality:{other_tahn:1}
end
