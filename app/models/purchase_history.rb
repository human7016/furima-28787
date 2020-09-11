class PurchaseHistory < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :item

  # validates
  validates :user_id, presence: true
  validates :item_id, presence: true
end
