class PasswordResetsController < ApplicationController

  skip_before_action :my_children
  
  def new
  end

  def create 
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to '/login', :alert => "Email sent with password reset instructions."
  end

  def edit 
    @user = User.find_by_password_reset_token(params[:id])
  end 

  def update
    @user = User.find_by_password_reset_token(params["id"]) 
    @user.update(reset_params)
    redirect_to '/login', :notice => "Password has been reset" 
  end

  private

  def reset_params
    params.require(:user).permit(:password)
  end

end