class PartiesController < ApplicationController
  def new
    # movie_data = SearchResults.new.details(movie_id)
    @movie = Movie.new(movie_title: params[:title], duration: params[:runtime])
    # binding.pry
  end
end
