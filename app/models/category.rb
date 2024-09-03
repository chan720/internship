class Category < ApplicationRecord
  has_many :product
  validates :name, :description, presence: true
  def self.ransackable_associations(auth_object = nil)
    [ "product" ]
  end
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "name", "updated_at" ]
  end
end
