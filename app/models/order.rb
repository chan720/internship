class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  def self.ransackable_associations(auth_object = nil)
    [ "order_items", "products", "user" ]
  end
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "status", "totalprice", "updated_at", "user_id" ]
  end
  def total_price
    order_items.sum { |item| item.total_price }
  end
end
