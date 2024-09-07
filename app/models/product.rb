class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :order_items
  has_many :reviews, dependent: :destroy

  validates :name, :description, :price, :stock, presence: true
  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "created_at", "description", "id", "name", "price", "stock", "updated_at" ]
  end
end
