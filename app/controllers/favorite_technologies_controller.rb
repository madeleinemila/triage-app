class FavoriteTechnologiesController < ApplicationController
  before_action :set_technology

  def create
    if Favorite.create(favorited: @technology, user: @current_user)
      redirect_to technology_path(@technology.id, anchor: "pin-update-t")
    else
      flash[:alert] = "Sorry, something went wrong, please try again."
      redirect_to @technology
    end
  end

  def destroy
    Favorite.where(favorited_id: @technology.id, user_id: @current_user.id, favorited_type: "Technology").first.destroy # first to strip array
    redirect_to technology_path(@technology.id, anchor: "pin-update-t")
  end

  private
  def set_technology
    @technology = Technology.find(params[:technology_id] || params[:id])  # params[:tech...] for create, params[:id] for destroy
  end
end
