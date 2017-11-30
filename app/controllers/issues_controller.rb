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
    @issues_all = Issue.all.sort_by { |i| i.summary.downcase }
    @search = { :path => issues_path, :type => "Search by issue. Get links to all possible fixes.", :class => "issue-shade"  }
  end

  def new
    @issue = Issue.new
    @technologies = Technology.all.sort_by { |t| t.name.downcase }
    @option = params[:id]
  end

  def create
    @issue = Issue.new issue_params
    if @issue.save
      redirect_to issue_path(@issue)
    else
      @technologies = Technology.all.sort_by { |t| t.name.downcase }
      render :new
    end
  end

  def edit
    @issue = Issue.find params[:id]
    @technologies = Technology.all.sort_by { |t| t.name.downcase }
  end

  def update
    @issue = Issue.find params[:id]
    if @issue.update issue_params
      redirect_to @issue
    else
      @technologies = Technology.all.sort_by { |t| t.name.downcase }
      render :edit
    end
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
