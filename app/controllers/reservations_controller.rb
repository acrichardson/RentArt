class ReservationsController < ApplicationController
    def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
    #   redirect_to @reservations_path
    # else
    #   render :new
  end

  def destroy
    @reservation = @reservation.find(params[:id])
    @reservation.destroy
  end

  def show
    @reservation = @reservation.find(params[:id])
  end

  private
  # def get_reservation
  #   @reservation = @reservation.find(params[:id])
  # end

  def reservation_params
    params.require(:reservations).permit(:id, :date, :product, :user, :review)
  end
end
