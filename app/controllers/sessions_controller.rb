class SessionsController < ApplicationController

  def new
  end

  def create
    user_session = User.find_by_username(params[:session][:username])
    if user_session && user_session.authenticate(params[:session][:password])
      session[:user_id] = user_session.id
      redirect_to '/'
    else
      redirect_to 'login'
    end 
  end

  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end

end
