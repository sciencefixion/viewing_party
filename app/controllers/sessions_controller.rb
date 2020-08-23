class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.update_or_create(auth)
    user.google_token = auth.credentials.token

    refresh_token = auth.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?

    user.save

    session[:user_id] = user.id
    redirect_to '/'
  end
end
