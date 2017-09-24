class SessionsController < ApplicationController
  def create
    puts auth_hash

    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end