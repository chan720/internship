class OrderItemsController < ApplicationController
  before_action :set_order

  def index
    @order_items = @order.order_items
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end
end
