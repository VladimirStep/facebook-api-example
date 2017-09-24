class SessionsController < ApplicationController
  def create
    session[:user_token] = auth_token
    redirect_to root_path
  end

  def destroy
    session.delete(:user_token)
    redirect_to root_path
  end

  private

  def auth_token
    request.env['omniauth.auth'][:credentials][:token]
  end
end