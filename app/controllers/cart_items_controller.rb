class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [ :increase, :decrease ]

  def create
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: cart_item_params[:product_id])
    @cart_item.quantity ||= 0
    @cart_item.quantity += cart_item_params[:quantity].to_i

    if @cart_item.save
      redirect_to cart_path, notice: "Item added to cart"
    else
      redirect_to product_path(cart_item_params[:product_id]), alert: "Could not add item to cart"
    end
  end

  def increase
    @cart_item.increment!(:quantity)
    redirect_to cart_path, notice: "Quantity increased."
  end

  def decrease
    if @cart_item.quantity > 1
      @cart_item.decrement!(:quantity)
    else
      @cart_item.destroy
    end
    redirect_to cart_path, notice: "Quantity decreased."
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
