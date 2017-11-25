class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    issue = Issue.create issue_params
    redirect_to issue_path(issue)
  end

  def edit
    @issue = Issue.find params[:id]
  end

  def update
    issue = Issue.find params[:id]
    issue.update issue_params
    redirect_to issue
  end

  def destroy
    issue = Issue.find params[:id]
    issue.destroy
    redirect_to issues_path
  end

  def show
    @issue = Issue.find params[:id]
  end

  private
  def issue_params
    params.require(:issue).permit(:summary, :details, :fix_id, :technology_id)
  end
end
