require 'rails_helper'

RSpec.describe "dashboard show page" do
  before :each do
    stub_omniauth
    visit "/"
    click_on "Log In with Google"
    @user = User.last
  end

  it "shows welcome message to user" do
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Hello, #{@user.username}")
  end

  it "shows a discover movies button" do
    expect(page).to have_button("Discover Movies")
    click_on "Discover Movies"
    expect(current_path).to eq("/discover")
  end

  it "has a friends section" do
    expect(page).to have_css(".friends")
    expect(page).to have_content("Friends")
  end

  it "displays no friends message if user has no friends" do
    within ".friends" do
      expect(page).to have_content("You currently have no friends")
    end
  end

  it "can add a friend" do
    friend = create(:user, username: "bob@george.com")

    within ".friends" do
      fill_in :username, with: friend.username
      click_on "Add Friend"
      expect(page).to have_content(friend.username)
    end

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Friend added successfully")
  end

  it "cannot add a friend who doesn't exist in database" do
    within ".friends" do
      fill_in :username, with: "tommy@chucky.com"
      click_on "Add Friend"
      expect(page).to_not have_content("tommy@chucky.com")
    end

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("The friend you tried to add does not exist")
  end

  it "has a viewing parties section" do
    expect(page).to have_css(".viewing-parties")
    expect(page).to have_content("Viewing Parties")
  end
end
