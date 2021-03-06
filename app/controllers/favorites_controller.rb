class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @kitchen = Kitchen.find(params[:kitchen_id])
    @favorite.kitchen = @kitchen
    @favorite.user = current_user
    @favorite.save
    redirect_to request.referer
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to request.referer
  end
end

