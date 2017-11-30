class FavoriteTechnologiesController < ApplicationController
  before_action :set_technology

  def create
    if Favorite.create(favorited: @technology, user: @current_user)
      redirect_to technology_path(@technology.id, anchor: "pin-update-t")
    else
      redirect_to @technology, alert: "Sorry, I can't pin that for you." #TODO put these somewhere or delete
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
