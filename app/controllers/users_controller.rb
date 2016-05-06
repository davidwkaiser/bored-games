class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["Account created!"]
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.uniq
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
      flash[:notice] = ["Account updated!"]
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy_data
    if @user.destroy
      flash[:notice] = ["Account deleted."]
      redirect_to root_path
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
