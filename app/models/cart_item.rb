class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  validates :quantity, numericality: { greater_than: 0 }
  after_initialize :set_default, if: :new_record?
  def total_price
    quantity * product.price
  end
  private
  def set_default
    self.quantity ||=0
  end
end
