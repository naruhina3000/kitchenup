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
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_kitchen
    params.require(:list).permit(:title, :description, :size, :listing_status,
    :address, :price, :cancellation_policy, :opening_time, :closing_time, :photos)
  end
end
