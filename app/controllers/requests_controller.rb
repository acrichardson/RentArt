class RequestsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
   @requests = policy_scope(Requests).order(created_at: :desc)
 end

def show
  @request = Request.find(params[:id])
  @review = Review.new
  authorize @request
end

 def new
  @product = Product.find(params[:product_id])
  @request = Request.new
  authorize @request
end

def create
  @product = Product.find(params[:product_id])
  @request = Request.new(request_params)
  @user = current_user
  @request.product = @product
  @request.user = @user
  @request.price = @product.price * (params[:request][:end_date].to_date - params[:request][:start_date].to_date)
  authorize @request
  if @request.save
      redirect_to product_request_path(@product, @request)
    else
      render :new
    end
end

def destroy
  @request = Request.find(params[:id])
  authorize @request
  @request.destroy
  redirect_to my_requests_path

end

def my_requests
  @request = current_user.requests
  authorize @request
end

private
  # def get_request
  #   @request = @request.find(params[:id])
  # end

  def request_params
    params.require(:request).permit(:id, :date, :product_id, :user_id, :review_id, :start_date, :end_date, :price)
  end
end
