require 'rails_helper'
# title
# vote average
# runtime
# genre(s)
# summary
# cast
# reviews
RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Dark Phoenix",
      vote_average: 6
    }
    movie = Movie.new(attrs)
    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Dark Phoenix")
    expect(movie.vote_average).to eq(6)
  end
end
