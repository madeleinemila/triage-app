class PagesController < ApplicationController
  def home
    if params[:term]
        @results = PgSearch.multisearch(params[:term])
    else
        @results = {}
    end
  end
end
