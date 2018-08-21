class ChefsController < ApplicationController
  # before_action :set_chef, only: [:show, :edit, :update, :destroy, :toggle_availability]

  def index
    @chefs = Chef.all
  end

  def create
    # Is this necessary? There is no new, and the create is done by Devise.
  end

  def show
    # set_chef
  end

  def edit
    # set_chef
  end

  def toggle_availability
    if @chef.availability == true
      @chef.availability = false
    else
      @chef.availability = true
    end
  end

  def update
    @chef = Chef.update(chef_params)
    redirect_to chef_path(@chef)
  end

  def destroy
    # set_chef
    @chef.destroy
    redirect_to chefs_path
  end

  private

  # def set_chef
  #   @chef = Chef.find(params[:id])
  # end

  def chef_params
    params.require(:chef).permit(:first_name, :last_name, :experience, :location,
                                 :photo_id, :telephone)
  end
end
