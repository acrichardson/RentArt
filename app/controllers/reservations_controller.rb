class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
   @reservations = policy_scope(Reservation).order(created_at: :desc)
 end

def show
  @reservation = Reservation.find(params[:id])
  @review = Review.new
  authorize @reservation
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
  @reservation.price = @product.price * (params[:reservation][:end_date].to_date - params[:reservation][:start_date].to_date)
  authorize @reservation
  if @reservation.save
      redirect_to product_reservation_path(@product, @reservation)
    else
      render :new
    end
end

def destroy
  @reservation = Reservation.find(params[:id])
  authorize @reservation
  @reservation.destroy
  redirect_to my_reservations_path

end

def my_reservations
  @reservations = current_user.reservations
  authorize @reservations
end

def my_product_reservations
  @reservations = Reservation.where(product_id: current_user.product_ids)
  authorize @reservations
end

private
  # def get_reservation
  #   @reservation = @reservation.find(params[:id])
  # end

  def reservation_params
    params.require(:reservation).permit(:id, :date, :product_id, :user_id, :review_id, :start_date, :end_date, :price)
  end
end
