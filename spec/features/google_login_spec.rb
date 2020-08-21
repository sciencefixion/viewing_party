require 'rails_helper'

RSpec.feature "user login" do
  # def stub_omniauth
  #   Omniauth.config.test_mode = true
  #   Omniauth.config.mock_auth[:google] = Faker::Omniauth.google
  # end

  scenario "uses google oauth2" do
    stub_omniauth

    visit root_path
    expect(page).to have_link("Log in with Google")
    click_link "Log in with Google"
    expect(current_path).to eq("/")
  end
end
