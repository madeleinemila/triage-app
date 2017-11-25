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
  end

  def show
    @issue = Issue.find params[:id]
  end

  private
  def issue_params
    params.require(:issue).permit(:summary, :details, :fix_id)
  end
end
