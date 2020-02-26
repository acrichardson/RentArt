class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @reservations = Reservation.all
  end

  def new
    @product = Product.find(params[:product_id])
    @reservation = Reservation.new
  end

  def create
    @product = Product.find(params[:product_id])
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @reservation.product = @product
    @reservation.user = @user
    if @reservation.save
    #   redirect_to @reservations_path
    # else
    #   render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  def show
    @reservation = Reservation.find(params[:id])
    @review = Review.new
  end

private
  # def get_reservation
  #   @reservation = @reservation.find(params[:id])
  # end

  def reservation_params
    params.require(:reservations).permit(:id, :date, :product_id, :user_id, :review_id)
  end
end
