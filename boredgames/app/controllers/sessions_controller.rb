class SessionsController < ApplicationController
  def create
    username = params[:session][:username]
    password = params[:session][:password]
    @user = User.find_by(username: username)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to '/users/new' #game index
  end
end
