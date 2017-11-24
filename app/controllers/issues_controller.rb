class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
  end

  def edit
  end

  def show
    @issue = Issue.find params[:id]
  end
end
