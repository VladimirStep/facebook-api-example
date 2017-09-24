class MainController < ApplicationController
  def index
    @user = User.get_info(session[:user_token])
  end

  def auth_fail

  end
end