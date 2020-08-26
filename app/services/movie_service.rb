class MovieService
  def conn
    Faraday.new('https://api.themoviedb.org/3/') do |f|
      f.params[:api_key] = ENV['movie_db_api_key']
    end
  end

  def json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_results(query)
    json("search/movie?query=#{query}")
  end

  def db_top_rated_movies
    json("movie/top_rated?")
  end

  def movie_data(movie_id)
    json("movie/#{movie_id}")
  end

  def cast(movie_id)
    json("movie/#{movie_id}/credits")
  end

  def reviews(movie_id)
    json("movie/#{movie_id}/reviews")
  end
end
