class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [ :create, :index ]
  before_action :set_order_item, only: [ :show ]

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = @order.order_items.new(order_item_params)

    if @order_item.save
      redirect_to order_path(@order), notice: "Order item successfully created."
    else
      render :new
    end
  end

  def index
    @order_items = @order.order_items.includes(:product)

    # Calculate total bill
    @total_bill = @order_items.sum { |item| item.quantity * item.product.price }
  end

  def show
    # Display a single order item
  end

  private

  def set_order
    @order = current_user.orders.find(params[:order_id])
  end

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity, :price)
  end
end
