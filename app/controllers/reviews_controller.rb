class ReviewsController < ApplicationController

  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
    authorize @review
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @review.reservation = @reservation
    authorize @review

    if @review.save
      redirect_to product_path(@reservation.product)
    else
      raise
      render :new
    end
  end

  def blank_star
    binding.pry
    @review = 5 - rating.to_i
    # authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
  end


  private

  def review_params
    params.require(:review).permit(:stars, :content)
  end

end
