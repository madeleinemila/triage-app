class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def new
    @technology = Technology.new
  end

  def create
    technology = Technology.create technology_params
    redirect_to technology_path(technology)
  end

  def edit
    @technology = Technology.find params[:id]
  end

  def update
    technology = Technology.find params[:id]
    technology.update technology_params
    redirect_to technology_path(technology)
  end

  def show
    @technology = Technology.find params[:id]
    unless @technology.links.nil?
      @links = @technology.links.split(' ')
    end
  end

  def destroy
    technology = Technology.find params[:id]
    technology.destroy
    redirect_to technologies_path
  end

  private
  def technology_params
    params.require(:technology).permit(:name, :links, :issue_id, :fix_id)
  end
end
