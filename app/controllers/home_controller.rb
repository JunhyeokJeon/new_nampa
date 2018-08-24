class HomeController < ApplicationController
  def index
    @manuals_all = Manual.all.order("created_at DESC")
    @manuals = @manuals_all[0..3]

    @products_all = Product.all.order("created_at DESC")
    @products = @products_all[0..3]

    @reviews_all = Review.all
  end
end
