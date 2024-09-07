class HomeController < ApplicationController
  def index
    @products=Product.all
    @categories = Category.all
    @featured_products = Product.where(featured: true).limit(8) # Adjust the number as needed
  end
end
