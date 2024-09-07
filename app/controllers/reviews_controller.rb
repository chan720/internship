class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)

    if @review.save
      redirect_to @product, notice: "Review submitted successfully."
    else
      redirect_to @product, alert: "Error submitting review."
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
