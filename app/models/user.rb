class User < ApplicationRecord
  has_secure_password

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid]) do |u|
      u.username = response[:info][:name]
      u.email = response[:info][:email]
    end
  end
end
