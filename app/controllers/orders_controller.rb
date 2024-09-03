class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_order, only: [ :show, :update, :destroy ]
  before_action :set_cart, only: [ :create ]

  # GET /orders
  def index
    @orders = current_user.orders if user_signed_in?
  end

  # GET /orders/:id
  def show
    # @order is set by the set_order before_action
  end

  # POST /orders
  def create
    @order = current_user.orders.new(order_params)
    @order.status = "pending"  # Default status for a new order

    if @order.save
      # Optionally, clear the cart or perform other actions
      current_user.cart.cart_items.destroy_all
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end

  # Set the cart for creating an order
  def set_cart
    @cart = current_user.cart
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:totalprice, :status)  # Adjust attributes as needed
  end
end
