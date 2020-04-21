class ApplicationController < ActionController::Base
	helper_method :current_user, :my_family, :logged_in?
private 

  def current_user
	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def my_family
    current_user.family.id
  end

  def logged_in?
    !!current_user
  end 

end