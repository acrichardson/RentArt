class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end
end
