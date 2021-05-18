class KitchenAmenitiesController < ApplicationController

    # def create
    #     @kitchen = Kitchen.find(params[:kitchen_id])
    #     params[:kitchen_amenity][:tag][1..-1].each do |amenity_id|
    #         KitchenAmenity.create(tag_id: amenity_id, kitchen: @kitchen)
    #     end
    #     redirect_to @kitchen
    # end

    # def update
    #     @kitchen = Kitchen.find(params[:kitchen_id])
    #     params[:kitchen_amenity][:tag][1..-1].each do |amenity_id|
    #         KitchenAmenity.update(tag_id: amenity_id, kitchen: @kitchen)
    #     end
    #     redirect_to @kitchen
    # end

    def destroy
        @kitchen_amenity = KitchenAmenity.find(params[:id])
        @kitchen_amenity.destroy
        redirect_to @kitchen_amenity.kitchen
    end

    private

    def kitchen_amenity_params
        params.require(:kitchen_amenity).permit(:tag_id)
    end

end
