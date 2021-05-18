class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :clean, :status]

  # def index
  #   @bookings = Booking.all
  # end


  def show
  end

  def edit

  end

  # def new
  #   @booking = Booking.new
  #   @kitchen = Kitchen.find(params[:kitchen_id])
  # end

  def create
    @booking = Booking.new(booking_params)
    @kitchen = Kitchen.find(params[:kitchen_id])
    @user = current_user
    @booking.kitchen = @kitchen
    @booking.user = @user
    if @booking.save
      redirect_to current_user
    else
      render "/kitchens/show"
    end
  end


  def clean
  end

  def status
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
