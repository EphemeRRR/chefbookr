class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    # set_user
  end

  # def create # Devise does this
  #   # Is this necessary? There is no new, and the create is done by Devise.
  # end

  # def edit # Devise does this
  #   # set_user
  # end

  # def update # Devise does this
  #   @user = User.update(user_params)
  #   redirect_to user_path(@user)
  # end

  def destroy
    @user.destroy
    redirect_to root
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def user_params # Devise does this
  #   params.require(:user).permit(:first_name. :last_name, :photo_id,
  #                                :location, :telephone)
  # end
end
