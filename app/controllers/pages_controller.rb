class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def search
    @kitchens = Kitchen.where('address LIKE ?', "%#params[:query]%")
    redirect_to kitchens_path
  end
end
