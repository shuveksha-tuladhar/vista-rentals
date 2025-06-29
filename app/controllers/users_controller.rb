class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:role] = @user.role
      redirect_to root_path, notice: "Account created and logged in!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password_hash, :role)
  end
end
