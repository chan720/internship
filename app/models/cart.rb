class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  belongs_to :admin_users
  def total_price
    cart_items.sum(&:total_price)
  end
end
