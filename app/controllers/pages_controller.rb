class PagesController < ApplicationController
  def home
    if params[:term]
        @results = PgSearch.multisearch(params[:term])
        if @results == []
          flash[:notice] = "No results found"
        end
    end
  end
end
