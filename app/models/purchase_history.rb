class PurchaseHistory < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :item

  # validates
  validates :user_id, :item_id, presence: true
end
