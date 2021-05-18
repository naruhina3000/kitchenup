class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit]

  def show
  end

  def edit
    
  end

  def new
  end

  def create
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
