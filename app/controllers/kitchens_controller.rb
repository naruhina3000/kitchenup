class KitchensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    # @kitchens = Kitchen.all
    # @kitchens = @kitchens.near(params[:address], 30) if params[:address].present?
    # @kitchens = @kitchens.where(params[:query]) if params[:query].present?
    @minsize = Kitchen.all.order(:size).first.size
    @maxsize = Kitchen.all.order(:size).last.size
    @minprice = Kitchen.all.order(:price).first.price
    @maxprice = Kitchen.all.order(:price).last.price

    @kitchens = Kitchen.where(listing_status: "listed")
    # @kitchens = Kitchen.geocoded.where(listing_status: "listed")

    if params[:query].present?
      sql_query = "title ILIKE :query OR address ILIKE :query"
      @kitchens = Kitchen.where(sql_query, query: "%#{params[:query]}%")
    end

    @kitchens = @kitchens.where('size >= ?', params[:minsize]) if params[:minsize].present?
    @kitchens = @kitchens.where('size <= ?', params[:maxsize]) if params[:maxsize].present?

    @kitchens = @kitchens.where('price >= ?', params[:minprice]) if params[:minprice].present?
    @kitchens = @kitchens.where('price <= ?', params[:maxprice]) if params[:maxprice].present?

     # @kitchens = @kitchens.joins(:amenities).where(amenities: {id: params[:amenities]}) if params[:amenities].present?
    if params[:amenities].present?
     @kitchens = @kitchens.select do |kitchen|
                  (params[:amenities].map(&:to_i) - kitchen.amenities.pluck(:id)).empty?
                end
    end

    @markers = @kitchens.map do |kitchen|
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen }),
        image_url: helpers.asset_url('kitchen.svg')
      }
    end
  end

  def show
    @booking = Booking.new
    @user = current_user
    @markers =
      [{
        lat: @kitchen.latitude,
        lng: @kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: @kitchen }),
        image_url: helpers.asset_url('kitchen.svg')

      }]
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
    @kitchen.photos.purge
    @kitchen.destroy
    redirect_to user_path(current_user)
  end

  def search
    @kitchens = Kitchen.where('address LIKE ?', "%#params[:query]%")
  end

  private

  def create_amenities(params)
    @kitchen.amenities.destroy_all
    params[:kitchen][:amenities].each {|amenity_id |  KitchenAmenity.create(kitchen: @kitchen, amenity_id: amenity_id)}
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
    :address, :price, :cancellation_policy, :opening_time, :closing_time, photos: [])
  end
end
