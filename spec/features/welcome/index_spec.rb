require 'rails_helper'

RSpec.describe 'welcome page' do
  it 'has root path to welcome page' do
    visit "/"

    expect(page).to have_content("Welcome To Viewing Party")
    expect(page).to have_content("Explore movies and create a viewing party event for you and your friends to watch a movie together")
  end
end
