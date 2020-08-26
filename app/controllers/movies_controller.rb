class MoviesController < ApplicationController
  def index
    search_results = SearchResults.new
    if params[:search].nil? == false
      @movies = search_results.movie_search_results(params[:search])
    else params[:q].nil? == false
      @movies = search_results.top_rated_movies
    end
  end

  def show
    movie = SearchResults.new
    @movie = movie.details(params[:id])
  end
end