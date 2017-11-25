class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def new
  end

  def edit
  end

  def show
    @technology = Technology.find params[:id]
    unless @technology.links.nil?
      @links = @technology.links.split(' ')
    end
  end
end
