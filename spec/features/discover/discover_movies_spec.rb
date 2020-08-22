require 'rails_helper'

RSpec.describe 'Discover movies page' do
  before :each do
    stub_omniauth
    @user = create(:user, username: 'walter@sobchak_security.com')
    visit '/'
    click_button 'Log in with Google'
    # visit '/discover'
  end
  it "when discover movies is clicked it redirects to a discover page" do
    visit '/dashboard'

    click_button 'Discover Movies'
    expect(current_path).to eq('/discover')
  end
end
