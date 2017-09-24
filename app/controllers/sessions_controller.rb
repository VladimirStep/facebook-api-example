class SessionsController < ApplicationController
  def create
    puts auth_hash
    session[:user_token] = auth_hash[:credentials][:token]
    redirect_to root_path
  end

  def destroy
    session.delete(:user_token)
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end