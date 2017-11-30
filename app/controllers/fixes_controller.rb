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
    @fixes_all = Fix.all
    @search = { :path => fixes_path, :type => "Search a list of all fix procedures here.", :class => "fix-slash"  }
  end

  def new
    @fix = Fix.new
  end

  def create
    @fix = Fix.new fix_params
    if @fix.save
      redirect_to fix_path(@fix)
    else
      render :new
    end
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
