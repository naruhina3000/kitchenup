class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to @booking
    else
      render 'bookings/show'
    end
  end

  def update
    @review = Review.find(params[:id])
    @booking = @review.booking
    if @review.update(review_params)
      redirect_to @booking
    else
      render 'bookings/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :reply)
  end

end
