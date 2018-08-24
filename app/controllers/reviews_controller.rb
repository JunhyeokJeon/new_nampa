class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(params[:review].permit(:rating, :review))
    @review.user = current_user
    @review.product_id = @product.id
    @review.save
    if @review.rating == nil
      @review.rating = 0
    end

    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy

    redirect_to @product
  end
end
