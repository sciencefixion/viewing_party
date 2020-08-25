class MovieResults
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
    @summary = data[:title]
  end

  private
  def search
    SearchResults.new
  end
end
