class FavoriteFixesController < ApplicationController
  before_action :set_fix

  def create
    if Favorite.create(favorited: @fix, user: @current_user)
      redirect_to @fix, notice: 'Fix has been pinned'
    else
      redirect_to @fix, alert: 'Sorry, something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @fix.id, user_id: @current_user.id).first.destroy
    redirect_to @fix
  end

  private
  def set_fix
    @fix = Fix.find(params[:fix_id] || params[:id])
  end
end
