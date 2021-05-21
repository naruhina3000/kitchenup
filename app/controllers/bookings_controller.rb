class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :show, :clean, :status, :accept, :confirm, :cancel]

  def index
    redirect_to current_user
  end


  def show
    @review = Review.new
    # @booking = Booking.where(id: @booking)
    @kitchen = @booking.kitchen
    @markers =
    [{
      lat: @kitchen.latitude,
      lng: @kitchen.longitude,
      image_url: helpers.asset_url('kitchen.svg')

    }]
  end


  def edit

  end

  def accept
    @booking.update(booking_status: "accepted")
    redirect_to current_user
  end


  def confirm
    @booking.update(booking_status: "confirmed")
    redirect_to current_user
  end

  def cancel
    @booking.update(booking_status: "declined")
    redirect_to current_user
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
