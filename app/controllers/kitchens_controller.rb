class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    @kitchens = Kitchen.all
  end

  def show
  end

  def edit
  end

  def update
    if @kitchen.update(kitchen_params)
      redirect_to @kitchen
    else
      render "edit"
    end
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @user = current_user
    @kitchen.user = @user
    if @kitchen.save
    redirect_to @kitchen
    else
     render 'new'
    end
  end

  def destroy
    @ktchen.destroy
    redirect_to kitchens_path
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:booking).permit(:title, :description, :size, :listing_status,
    :address, :price, :cancellation_policy, :opening_time, :closing_time, :photos)
  end
end
