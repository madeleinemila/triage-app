class FavoriteFixesController < ApplicationController
  before_action :set_fix

  def create
    if Favorite.create(favorited: @fix, user: @current_user)
      redirect_to fix_path(@fix.id, anchor: "pin-update-f")
    else
      redirect_to @fix, alert: "Sorry, I can't pin that for you."
    end
  end

  def destroy
    Favorite.where(favorited_id: @fix.id, user_id: @current_user.id, favorited_type: "Fix").first.destroy # first to strip array
    redirect_to fix_path(@fix.id, anchor: "pin-update-f")
  end

  private
  def set_fix
    @fix = Fix.find(params[:fix_id] || params[:id])  # params[:fix_id] for create, params[:id] for destroy
  end
end
