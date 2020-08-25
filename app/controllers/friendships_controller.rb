class FriendshipsController < ApplicationController
  def create
    user = User.find(current_user.id)
    friend = User.find_by(username: params[:username])
    if friend
      friendship = Friendship.create_reciprocal_for_ids(current_user.id, friend.id)
      redirect_to "/dashboard"
      flash[:message] = "Friend added successfully"
    else
      redirect_to "/dashboard"
      flash[:error] = "The friend you tried to add does not exist"
    end
  end
end
