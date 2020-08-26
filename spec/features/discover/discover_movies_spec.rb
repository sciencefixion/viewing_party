require 'rails_helper'

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
    click_on "Discover Top-Rated Movies"
    expect(current_path).to eq("/movies")
  end

  it "has a text field to enter keywords to find movies" do
    fill_in :search, with: "Spiderman"
    click_on "Find Movies"
    expect(current_path).to eq("/movies")
  end
end
