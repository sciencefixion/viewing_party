require 'rails_helper'

# As an authenticated user,
# I should see a button to discover top-rated movies,
# I should also see a text field to enter a keyword(s) in the movie title and a "Find Movies" button
#
# Details: This page is where a user can search for movies for their viewing party.

RSpec.describe 'Discover movies page' do
  before :each do
    stub_omniauth
    visit '/'
    click_on 'Log In with Google'
    @user = User.last
    visit '/discover'
  end
  it "when discover movies is clicked it redirects to a discover page" do
    visit '/dashboard'

    click_button 'Discover Movies'
    expect(current_path).to eq('/discover')
  end
  it "displays a button to discover top-rated movies" do

    expect(page).to have_button("Discover Top-Rated Movies")

  end
  it "has a text field to enter keywords to find movies" do

    fill_in :search, with: "Spiderman"
    click_on "Find Movies"
  end
end
