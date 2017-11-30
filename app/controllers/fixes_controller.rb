class FixesController < ApplicationController
  before_action :check_if_admin, :except => [:index, :show]

  def index
    # IF SEARCH TERM PRESENT:
    if params[:term]
      @fixes = Fix.search_full_text(params[:term])
      if @fixes == []
        flash[:notice] = "No results found"
      end
    end
    # For rest of page:
    @fixes_all = Fix.all.sort_by { |f| f.title.downcase }
    @search = { :path => fixes_path, :type => "Search by fix. Get links to step-by-step guides.", :class => "fix-shade"  }
  end

  def new
    @fix = Fix.new
    @issues = Issue.all.sort_by { |i| i.summary.downcase }
    @option = params[:id]
  end

  def create
    @fix = Fix.new fix_params
    if @fix.save
      redirect_to fix_path(@fix)
    else
      @issues = Issue.all.sort_by { |i| i.summary.downcase }
      @option = params[:id]
      render :new
    end
  end

  def edit
    @fix = Fix.find params[:id]
    @issues = Issue.all.sort_by { |i| i.summary.downcase }
    @option = @fix.issue_ids.first
  end

  def update
    @fix = Fix.find params[:id]
    if @fix.update fix_params
      redirect_to fix_path(@fix)
    else
      @issues = Issue.all.sort_by { |i| i.summary.downcase }
      @option = @fix.issue_ids.first
      render :edit
    end
  end

  def show
    @fix = Fix.find params[:id]
    @fix_tech = @fix.technologies.sort_by { |t| t.name.downcase }
    @ctrl = { :type => "fix", :ed => edit_fix_path(@fix.id), :del => @fix }
  end

  def destroy
    fix = Fix.find params[:id]
    fix.destroy
    redirect_to fixes_path
  end

  private
  def fix_params
    params.require(:fix).permit(:title, :steps, :technology_id, :issue_ids)
  end
end
