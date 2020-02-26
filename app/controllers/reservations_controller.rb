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
    authorize @reservation
    if @reservation.save
    #   redirect_to @reservations_path
    # else
    #   render :new
    end
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
    params.require(:reservation).permit(:id, :date, :product_id, :user_id, :review_id, :reservations)
  end
end
