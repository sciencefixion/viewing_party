require 'rails_helper'

RSpec.describe "movies index page" do
  before :each do
    stub_omniauth
    visit '/'
    click_on 'Log In with Google'
    @user = User.last
    visit '/discover'
  end

  it "displays 40 results based on user search" do
    fill_in :search, with: "Batman"
    click_on "Find Movies"
    expect(current_path).to eq("/movies")

    expect(page).to have_content("Batman Begins")
    expect(page).to have_content("Vote Average: 7.7")
  end

  it "displays 40 top-rated movies" do
    visit "/movies"
    click_on "Discover Top-Rated Movies"

    expect(page).to have_content("Pulp Fiction")
    expect(page).to have_content("Vote Average: 8.5")
  end

  it "enables links to movie show page from each movie title" do
    movie_id = 272

    visit "/movies"

    fill_in :search, with: "Batman"
    click_on "Find Movies"

    click_on "Batman Begins"
    expect(current_path).to eq("/movies/#{movie_id}")
  end

  it "displays message if no search results are found" do
    visit "/movies"

    fill_in :search, with: "abc123"
    click_on "Find Movies"

    expect(page).to have_content("There are no movies that matched your search")
  end
end
