class User < ApplicationRecord
  validates :username, presence: true
  validates :uid, uniqueness: true, presence: true
  validates :google_token, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def self.update_or_create(auth)
    User.find_or_create_by(uid: auth[:uid]) do |user|
      user.username = auth[:info][:email]
      user.uid = auth[:uid]
    end
  end
end
