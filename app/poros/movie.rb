class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
  end

  def format_runtime
    "#{@runtime / 60} hr #{@runtime % 60} min"
  end

  def ten_cast_members
    cast = search.cast(@id)
    cast[:cast].first(10)
  end

  def reviews
    reviews = search.reviews(@id)
    reviews[:results]
  end

  def count_of_reviews
    reviews.size
  end

  def genres_names
    genre_names = []
    @genres.each do |genre|
      genre_names << genre[:name]
    end
    genre_names.join(', ')
  end

  private

  def search
    SearchResults.new
  end
end
