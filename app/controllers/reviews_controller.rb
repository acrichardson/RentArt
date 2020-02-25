class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @review.reservation = @reservation

    if @review.save
      redirect_to product_path(@reservation.product)
    else
      raise
      render :new
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:stars, :content)
  end

end
