class PaymentsController < ApplicationController
  def new
    # Display the payment form
  end

  def create
    # Handle Stripe payment creation here
    @amount = 1000 # example amount in cents

    begin
      charge = Stripe::Charge.create({
        amount: @amount,
        currency: "usd",
        source: params[:stripeToken],
        description: "Example charge"
      })

      flash[:success] = "Payment successfully completed!"
      redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end
  end
end
