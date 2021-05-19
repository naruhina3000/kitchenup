class KitchensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    @kitchens = Kitchen.all
  end

  def show
    @booking = Booking.new
  end

  def edit
    amenities_list
  end

  def update
    if @kitchen.update(kitchen_params)
      create_amenities(params)
      redirect_to @kitchen
    else
      render "edit"
    end
  end

  def new
    @kitchen = Kitchen.new
    amenities_list
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @user = current_user
    @kitchen.user = @user
    if @kitchen.save
      create_amenities(params)
      redirect_to @kitchen
    else
     render 'new'
    end
  end

  def destroy
    @kitchen.destroy
    redirect_to kitchens_path
  end

  def search
    @kitchens = Kitchen.where('address LIKE ?', "%#params[:query]%")
  end

  private

  def create_amenities(params)
    params[:kitchen][:amenities][1..-1].each {|amenity_id |  KitchenAmenity.create(kitchen: @kitchen, amenity_id: amenity_id)}
  end

  def amenities_list
    @kitchen_amenity = KitchenAmenity.new
    @used_amenity_id = @kitchen.amenities.pluck(:id)
    @free_amenities = Amenity.where.not(id: @used_amenity_id)
    @used_amenities = Amenity.where(id: @used_amenity_id)
    @all_amenities = Amenity.all
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:title, :description, :size, :listing_status,
    :address, :price, :cancellation_policy, :opening_time, :closing_time, :photos)
  end
end
