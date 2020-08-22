require 'rails_helper'

RSpec.describe "Welcome index page" do
  it "displays a welcome message to the app" do
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
  end

  
end
