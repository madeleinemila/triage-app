class TechnologiesController < ApplicationController
  before_action :check_if_admin, :except => [:index, :show]

  def index
    if params[:term]
      @technologies = Technology.search_by_name(params[:term])
      @technologies = @technologies.sort_by { |t| t.name.downcase }
      if @technologies == []
        flash[:notice] = "No results found"
      end
    end
    @technologies_all = Technology.all.sort_by { |t| t.name.downcase }
    @search = { :path => technologies_path, :type => "Search by technology to get a link to all related fixes and manuals", :class => "tech-slash"  }
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
    @ctrl = { :type => "technology", :ed => edit_technology_path(@technology.id), :del => @technology }
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
