class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :toggle_availability, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        chefs.first_name @@ :query \
        OR chefs.last_name @@ :query \
        OR chefs.specialty @@ :query \
        OR chefs.location @@ :query \
        OR menus.description @@ :query \
      "
      @chefs = Chef.joins(:menus).where(sql_query, query: "%#{params[:query]}%")
    else
      @chefs = Chef.all
    end
  end

  # def create # Devise does this
  #   # Is this necessary? There is no new, and the create is done by Devise.
  # end

  def show
    # set_chef
    @booking = Booking.new
    @menus = @chef.menus
    # @menus = @chef.menus.sort_by { |menu| menu.price }
  end

  # def edit # Devise does this
  #   # set_chef
  # end

  def toggle_availability
    if @chef.availability == true
      @chef.availability = false
    else
      @chef.availability = true
    end
  end

  # def update # Devise does this
  #   @chef = Chef.update(chef_params)
  #   redirect_to chef_path(@chef)
  # end

  def destroy
    # set_chef
    @chef.destroy
    redirect_to chefs_path
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  # def chef_params # Devise does this
  #   params.require(:chef).permit(:first_name, :last_name, :bio, :experience, :location,
  #                                :photo_id, :telephone, :specialty)
  # end
end
