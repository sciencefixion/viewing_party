class Friendship
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :friend, scope: :user, message: "You have already added this friend"
end
