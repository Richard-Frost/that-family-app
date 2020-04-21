class SessionsController < ApplicationController
  
  def new
  end

  def create 
  	user = User.find_by(email: params[:user][:email])
  	user = user.try(:authenticate, params[:user][:password])
  	return redirect_to(controller: 'sessions', action: 'new') unless user
  	session[:user_id] = user[:id]
  	@user = user
  	redirect_to '/home'
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end


end 