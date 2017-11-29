class FixesController < ApplicationController
  before_action :check_if_admin, :except => [:index, :show]

  def index
    if params[:term]
      @fixes = Fix.search_by_title_and_steps(params[:term])
    else
      @fixes = {}
    end
    @fixes_all = Fix.all
    @search = { :path => fixes_path, :type => "Search a list of all fix procedures here", :class => "fix-slash"  }
  end

  def new
    @fix = Fix.new
  end

  def create
    fix = Fix.create fix_params
    redirect_to fix_path(fix)
  end

  def edit
    @fix = Fix.find params[:id]
  end

  def update
    fix = Fix.find params[:id]
    fix.update fix_params
    redirect_to fix_path(fix)
  end

  def show
    @fix = Fix.find params[:id]
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
