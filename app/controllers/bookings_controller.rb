class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit, :destroy]

  def show
  end

  def create
    # calculate price
    #
  end

  def edit

  end

  def update
    # get comment
    # change confirm status
    @booking.update(booking_params)
    @booking.confirm = true
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params # Devise does this
    params.require(:booking).permit(:menu_count, :start_date, :end_date, :comment)
  end
end
