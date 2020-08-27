require 'rails_helper'

RSpec.describe "New viewing party page" do
  before :each do
    stub_omniauth
    @movie_id = 272

    visit '/'
    click_on 'Log In with Google'
    @user = User.last
    visit '/discover'
  end

  it "displays a form to create a new viewing party" do
    search = SearchResults.new
    movie = search.details(@movie_id)
    friend1 = create(:user, username: 'test1@test.com')
    friend2 = create(:user, username: 'test2@test.com')
    friend3 = create(:user, username: 'test3@test.com')
    Friendship.create_reciprocal_for_ids(@user.id, friend1.id)
    Friendship.create_reciprocal_for_ids(@user.id, friend2.id)
    Friendship.create_reciprocal_for_ids(@user.id, friend3.id)

    visit '/viewing-party/new'

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.runtime)
    expect(page).to have_content('When')
    expect(page).to have_content('test1@test.com')
    expect(page).to have_content('test2@test.com')
    expect(page).to have_content('test3@test.com')
    expect(page).to have_button('Create Party')

  end
end
