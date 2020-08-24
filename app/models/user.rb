class User < ApplicationRecord
  validates_presence_of :username
  validates :uid, uniqueness: true, presence: true
  validates :google_token, uniqueness: true

  def self.update_or_create(auth)
    user = User.find_or_create_by(uid: auth[:uid]) do |user|
      user.username = auth[:info][:email]
      user.uid = auth[:uid]
    end
  end
end
