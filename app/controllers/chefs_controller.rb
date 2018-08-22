class ChefsController < ApplicationController
  # before_action :set_chef, only: [:show, :edit, :update, :destroy, :toggle_availability]

  def index
    @chefs = Chef.all
  end

  # def create # Devise does this
  #   # Is this necessary? There is no new, and the create is done by Devise.
  # end

  def show
    # set_chef
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

  # def set_chef
  #   @chef = Chef.find(params[:id])
  # end

  # def chef_params # Devise does this
  #   params.require(:chef).permit(:first_name, :last_name, :experience, :location,
  #                                :photo_id, :telephone, :specialty)
  # end
end
