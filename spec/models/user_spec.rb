require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :uid }
    it { should validate_uniqueness_of :uid }
    it { should validate_uniqueness_of :google_token }
  end

  it "creates or updates itself from an oauth hash" do
    auth = {
      provider: 'google_oauth2',
      uid: '100000000000000000000',
      info: {
          name: 'Walter Sobchak',
          email: 'walter@sobchak_security.com',
          first_name: 'Walter',
          last_name: 'Sobchak',
          image: 'https://lh4.googleusercontent.com/photo.jpg',
          urls: {
              google: 'https://plus.google.com/+WalterSobchak'
          }
      },
      credentials: {
          token: 'TOKEN',
          refresh_token: 'REFRESH_TOKEN',
          expires_at: 1496120719,
          expires: true
      },
      extra: {
          id_token: 'ID_TOKEN',
          id_info: {
              azp: 'APP_ID',
              aud: 'APP_ID',
              sub: '100000000000000000000',
              email: 'walter@sobchak_security.com',
              email_verified: true,
              at_hash: 'HK6E_P6Dh8Y93mRNtsDB1Q',
              iss: 'accounts.google.com',
              iat: 1496117119,
              exp: 1496120719
          },
          raw_info: {
              sub: '100000000000000000000',
              name: 'Walter Sobchak',
              given_name: 'Walter',
              family_name: 'Sobchak',
              profile: 'https://plus.google.com/+WalterSobchak',
              picture: 'https://lh4.googleusercontent.com/photo.jpg?sz=50',
              email: 'walter@sobchak_security.com',
              email_verified: 'true',
              locale: 'en',
              hd: 'company.com'
          }
      }
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.uid).to eq('100000000000000000000')
    expect(new_user.username).to eq('walter@sobchak_security.com')
    
  end
end
