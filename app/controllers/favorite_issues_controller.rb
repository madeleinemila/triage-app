class FavoriteIssuesController < ApplicationController
  before_action :set_issue

  def create
    if Favorite.create(favorited: @issue, user: @current_user)
      redirect_to @issue, notice: 'Project has been favorited'
    else
      redirect_to @issue, alert: 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @issue.id, user_id: @current_user.id).first.destroy
    redirect_to @issue
  end

  private
  def set_issue
    @issue = Issue.find(params[:issue_id] || params[:id])
  end
end
