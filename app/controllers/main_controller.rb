class MainController < ApplicationController
  def index
    @user = User.facebook_api(session[:user_token]) if session[:user_token]
  end

  def auth_fail
  end
end