class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log in session
      redirect_to @user
    else

      redirect_to new_user_path
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def show
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    puts "yay"
    if @user.destroy
      redirect_to new_user_path
    else
      redirect_to @user
      # redirect_to root
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
