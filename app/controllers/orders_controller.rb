class OrdersController < ApplicationController
  before_action :set_order, only: [ :show ]
  def index
    @orders = Order.where(user: current_user)
  end
  def success
  end
  def show
  end
  def create
    @order = Order.new(user: current_user, status: "pending")
    if @order.save
      current_cart.cart_items.each do |item|
        @order.order_items.create(product: item.product, quantity: item.quantity)
      end
      current_cart.cart_items.destroy_all
      session[:cart_id] = nil
      redirect_to order_items_path(order_id: @order.id, status: "succesfull"), notice: "Order was successfully created."
    else
      redirect_to cart_path, alert: "Order could not be created."
    end
  end
  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit, alert: "Order could not be updated."
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end
  def order_params
    params.require(:order).permit(:user_id, :status)
  end
end
