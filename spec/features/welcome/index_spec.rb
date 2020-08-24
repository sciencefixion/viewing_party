require 'rails_helper'

RSpec.describe "Welcome index page" do
  it "displays a welcome message to the app" do
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("Use this application to explore movie options and create viewing party events for yourself and your friends!")
  end

  it "allows user to log in with google oauth2" do
    user = User

    stub_omniauth
    visit root_path
    expect(page).to have_link("Log In with Google")
    click_on "Log In with Google"
    expect(current_path).to eq("/dashboard")
  end
end
