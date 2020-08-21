require 'rails_helper'

RSpec.describe "user dashboard page" do
  xit "displays welcome username message at top of dashboard" do
    visit "/dashboard"

    expect(page).to have_content("Welcome ")
  end

  it "has a button to Discover Movies" do
    visit "/dashboard"

    expect(page).to have_button("Discover Movies")
  end

  it "has a Friends section" do
    visit "/dashboard"

    expect(page).to have_css(".friends")
  end

  it "has a Viewing Parties section" do
    visit "/dashboard"

    expect(page).to have_css(".viewing-parties")
  end
end
