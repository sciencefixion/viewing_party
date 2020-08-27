require 'rails_helper'

RSpec.describe "movie details show page" do
  before :each do
    stub_omniauth
    visit '/'
    click_on 'Log In with Google'
    @user = User.last
    visit '/discover'
  end

  it "displays details for a specific movie" do
    movie_id = 272
    search = SearchResults.new
    movie = search.details(movie_id)
    cast = search.cast(movie_id)
    reviews = search.reviews(movie_id)

    visit "/movies/#{movie_id}"

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.vote_average)
    expect(page).to have_content(movie.format_runtime)
    expect(page).to have_content(movie.genres_names)
    # test fails even though it shows us the text in the view that it says it
    # can't find - ????
    expect(page).to have_content("Driven by tragedy, billionaire Bruce Wayne dedicates his life to uncovering and defeating the corruption that plagues his home, Gotham City. Unable to work within the system, he instead creates a new identity, a symbol of fear for the criminal underworld - The Batman.")
    expect(movie.ten_cast_members).to be_an_instance_of(Array)
    expect(page).to have_content(movie.ten_cast_members.first[:name])
    expect(page).to have_content(movie.ten_cast_members.last[:name])
    expect(page).to have_content(movie.ten_cast_members.first[:character])
    expect(page).to have_content(movie.ten_cast_members.last[:character])
    expect(page).to have_content(movie.count_of_reviews)
  end
  it "has a button to create a viewing party" do
    # As an authenticated user,
    # When I visit the movies details page,
    # and I click the button to create a viewing party,
    # I should be redirected to a new viewing party form

    movie_id = 272
    search = SearchResults.new
    movie = search.details(movie_id)
    cast = search.cast(movie_id)
    reviews = search.reviews(movie_id)

    visit "/movies/#{movie_id}"

    click_on "Create a Viewing Party"

    expect(current_path).to eq("/viewing-party/new/#{movie_id}")
  end
end
