class FavoriteIssuesController < ApplicationController
  before_action :set_issue

  def create
    if Favorite.create(favorited: @issue, user: @current_user)
      redirect_to issue_path(@issue.id, anchor: "pin-update-i")
    else
      redirect_to @issue, alert: "Sorry, I can't pin that for you."
    end
  end

  def destroy
    Favorite.where(favorited_id: @issue.id, user_id: @current_user.id, favorited_type: "Issue").first.destroy # first to strip array
    redirect_to issue_path(@issue.id, anchor: "pin-update-i")
  end

  private
  def set_issue
    @issue = Issue.find(params[:issue_id] || params[:id])  # params[:issue_id] for create, params[:id] for destroy
  end
end
