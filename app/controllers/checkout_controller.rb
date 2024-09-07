# class CheckoutController < ApplicationController
#   def create
#     product = Product.find(params[:id])
#     @session = Stripe::Checkout::Session.create({
#       payment_method_types: [ "card" ],
#       line_items: [ {
#         price_data: {
#           product_data: {
#             name: product.name  # Product name
#           },
#           unit_amount: (product.price * 100).to_i,
#           currency: "usd"  # Currency in which the transaction is made
#         },
#         quantity: 1  # Quantity of the product
#       } ],
#       mode: "payment",
#       success_url: root_url,
#       cancel_url: root_url
#     })

#     redirect_to @session.url, allow_other_host: true
#   end
# end

class CheckoutController < ApplicationController
  def create
    # Assuming current_cart returns the user's current cart
    @cart = current_cart
    line_items = @cart.cart_items.map do |item|
      {
        price_data: {
          product_data: {
            name: item.product.name  # Product name
          },
          unit_amount: (item.product.price * 100).to_i, # Stripe expects amount in cents
          currency: "usd"  # Currency in which the transaction is made
        },
        quantity: item.quantity  # Quantity of the product
      }
    end

    @session = Stripe::Checkout::Session.create({
      payment_method_types: [ "card" ],
      line_items: line_items,
      mode: "payment",
      success_url: order_success_url,  # Redirect to a success page
      cancel_url: cart_url  # Redirect back to cart on cancellation
    })

    redirect_to @session.url, allow_other_host: true
  end
end
