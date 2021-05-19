class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      # @bookings = Booking.where('user_id = ?', @user )
      # @bookings = Booking.find(params[:id])
      # @bookings_requested = Booking.where('user_id = ?', @user )
      @bookings_requested = Booking.where(user: @user)
      @bookings_received = Booking.joins(:kitchen).where(kitchens: {user: @user})
    end
end
