class FixesController < ApplicationController
  def index
    @fixes = Fix.all
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

  def destroy
    fix = Fix.find params[:id]
    fix.destroy
    redirect_to fixes_path
  end

  def show
    @fix = Fix.find params[:id]
  end

  private
  def fix_params
    params.require(:fix).permit(:title, :steps, :issue_id)
  end
end
