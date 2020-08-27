class PartiesController < ApplicationController
  def new
    @movie = Movie.new(movie_title: params[:title], duration: params[:runtime])
  end
end
