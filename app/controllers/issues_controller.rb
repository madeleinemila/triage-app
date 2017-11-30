class IssuesController < ApplicationController
  before_action :check_if_admin, :except => [:index, :show]

  def index
    # IF SEARCH TERM PRESENT:
    if params[:term]
      @issues = Issue.search_full_text(params[:term])
      if @issues == []
        flash[:notice] = "No results found"
      end
    end
    # For rest of page:
    @issues_all = Issue.all
    @search = { :path => issues_path, :type => "Got a particular issue?  Search by issue and get a link to all the possible solutions.", :class => "issue-slash"  }
  end

  def new
    @issue = Issue.new
    @technologies = Technology.all.sort_by { |t| t.name.downcase }
  end

  def create
    issue = Issue.create issue_params
    redirect_to issue_path(issue)
  end

  def edit
    @issue = Issue.find params[:id]
    @technologies = Technology.all.sort_by { |t| t.name.downcase }
  end

  def update
    issue = Issue.find params[:id]
    issue.update issue_params
    redirect_to issue
  end

  def show
    @issue = Issue.find params[:id]
    @ctrl = { :type => "issue", :ed => edit_issue_path(@issue.id), :del => @issue }
  end

  def destroy
    issue = Issue.find params[:id]
    issue.destroy
    redirect_to issues_path
  end

  private
  def issue_params
    params.require(:issue).permit(:summary, :details, :fix_id, :technology_ids => [])
  end
end
