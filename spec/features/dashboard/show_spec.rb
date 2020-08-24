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

  it "has a viewing parties section" do
    expect(page).to have_css(".viewing-parties")
    expect(page).to have_content("Viewing Parties")
  end
end
