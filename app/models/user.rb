class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :credit_cards, dependent: :destroy

  after_commit :assign_customer_id, on: :create
  enum role: { user: 0, admin: 1 }
  has_one  :cart
  has_many :orders
  has_many :order_items
  def admin?
    role=="admin"
  end
  def assign_customer_id
    customer = Stripe::Customer.create(email: email)
    self.customer_id = customer.id
  end
end
