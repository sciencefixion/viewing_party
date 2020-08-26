class MoviesController < ApplicationController
  def index
    search = params[:search]
    if search
      @movies = SearchResults.new.movie_search_results(search)
    else
      @movies = SearchResults.new.top_rated_movies
    end
  end

  def show
    movie = SearchResults.new
    @movie = movie.details(params[:id])
  end
end
