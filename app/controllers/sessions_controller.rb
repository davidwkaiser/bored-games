class SessionsController < ApplicationController
  def create
    username = session_params[:username]
    password = session_params[:password]
    @user = User.find_by(username: username)
    if @user
      if @user.authenticate(password)
        session[:user_id] = @user.id
        current_user = @user
        redirect_to @user
      else
        flash[:errors] = ["Incorrect username/password combination"]
        redirect_to '/login'
      end
    else
      flash[:errors] = ["Could not find user with that name"]
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to root_path #game index
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
