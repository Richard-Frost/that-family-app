class SessionsController < ApplicationController
   
  def welcome
  end

  def create 
  	user = User.find_by(email: params[:user][:email])
  	user = user.try(:authenticate, params[:user][:password])
    if !user
      flash[:error] = "Sorry, Username or Password is incorrect!"
      redirect_to '/login'
      #redirect_to(controller: 'sessions', action: 'new') unless user
    else
  	  session[:user_id] = user[:id]
  	  @user = user
  	  redirect_to '/home'
    end
  end

  def create_menu
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
