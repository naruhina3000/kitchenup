class FavoritesController < ApplicationController
  
  def index
    @favorites = Favorite.all
  end
  
  def create
    @favorite = Favorite.new(favorite_params)
    @kitchen = kitchen.find(params[:kitchen_id])
    @favorite.kitchen = @kitchen
    if @favorite.save
        redirect_to @kitchen
    else
        render "/kitchens"
    end
  end

  def destroy
  end

  def favorite_params
    params.require(:favorite).permit(:user_id)
  end

end
