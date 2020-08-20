class SessionsController < ApplicationController
  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Login failed. Please try again"
      redirect_to '/'
    end
  end
end
