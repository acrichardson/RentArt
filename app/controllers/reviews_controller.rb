class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)

    @review.product = @product
    if @review.save
      redirect_to product_path(@Product)
    else
      render :new
    end
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
