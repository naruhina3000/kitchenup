class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      # @bookings = Booking.where('user_id = ?', @user )
      # @bookings = Booking.find(params[:id])
      # @bookings_requested = Booking.where('user_id = ?', @user )
      @bookings_requested = Booking.where(user: @user)
      @bookings_received = Booking.joins(:kitchen).where(kitchens: {user: @user})
      @my_kitchens = Kitchen.where(user: @user)
      @my_favorites = Favorite.where(user: @user)
    end

    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
  
      if @user.update(user_params)
        redirect_to @user
      else
        render "edit"
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :photo)
    end
end
