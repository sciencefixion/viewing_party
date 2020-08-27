class PartiesController < ApplicationController
  def new
    @movie = SearchResults.new.details(params[:id])
  end

  def create
  end
end
