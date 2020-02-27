class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
   @reservations = policy_scope(Reservation).order(created_at: :desc)
 end

 def new
  @product = Product.find(params[:product_id])
  @reservation = Reservation.new
  authorize @reservation
end

def create
  @product = Product.find(params[:product_id])
  @reservation = Reservation.new(reservation_params)
  @user = current_user
  @reservation.product = @product
  @reservation.user = @user
  @reservation.price = @product.price * (params[:reservation][:start_date].to_date - params[:reservation][:end_date].to_date)
  authorize @reservation
 #   if @reservation.save
 #   redirect_to @product_reservations_path(@product)
 # else
 #   render :new
 #  end
end

def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  authorize @reservation
end

def show
  @reservation = Reservation.find(params[:id])
  @review = Review.new
  authorize @reservation
end

private
  # def get_reservation
  #   @reservation = @reservation.find(params[:id])
  # end

  def reservation_params
    params.require(:reservation).permit(:id, :date, :product_id, :user_id, :review_id, :start_date, :end_date, :price)
  end
end
