class PagesController < ApplicationController
  def home
    if params[:term]
        @results = PgSearch.multisearch(params[:term])
        if @results == []
          flash[:notice] = "No results found"
        end
    end
    if @current_user.present?
      @current_fav_issues = @current_user.favorite_issues.sort_by { |fi| fi.summary.downcase }
      @current_fav_fixes = @current_user.favorite_fixes.sort_by { |ff| ff.title.downcase }
      @current_fav_techs = @current_user.favorite_technologies.sort_by { |ft| ft.name.downcase }
    end
  end
end
