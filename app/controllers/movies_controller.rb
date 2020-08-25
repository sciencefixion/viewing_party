class MoviesController < ApplicationController
  def index

    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params[:api_key] = ENV['MOVIE_DB_API_KEY']
    end

    response = conn.get('')

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:]
  end
end
