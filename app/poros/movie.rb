class Movie
  attr_reader :title,
              :vote_average

  def initialize(movie_info)
    binding.pry
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
  end
end
