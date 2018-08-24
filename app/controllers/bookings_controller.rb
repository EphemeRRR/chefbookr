class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    # calculate price
    if user_signed_in? == false
      redirect_to new_user_session_path
    else
      @booking = Booking.create(booking_params)
      @booking.user = current_user
      @booking.price = @booking.menu.price * @booking.menu_count
      @booking.save
      redirect_to edit_booking_path(@booking.id)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @menus = @booking.menu.chef.menus
  end

  def update
    # get comment
    # change confirm status
    @booking.update(booking_params)
    @booking.confirm = true
    @booking.save
    redirect_to booking_path(@booking.id)
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params # Devise does this
    params.require(:booking).permit(:menu_count, :start_date, :end_date, :comment, :menu_id)
  end
end
