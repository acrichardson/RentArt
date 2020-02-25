class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)

     @product = Products.find(id)
     res = @product.reservations

    if @review.save
      @reservation.review_id = @review.id
      @reservation.save
      redirect_to product_path(@Product)
    else
      render :new
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:reviews).permit(:stars, :content)
  end

end
