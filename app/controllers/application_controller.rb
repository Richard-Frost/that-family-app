class ApplicationController < ActionController::Base

  layout :resolve_layout

	helper_method :current_user, :my_family, :logged_in?, :my_children,  :playdates_near_me, :omni_redirect, :user_complete, :logged_in

  private 

  def current_user
	  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def my_family
    #return  current_user.family.id if current_user
    #return nil if !current_user
    if current_user.family != nil 
      return  current_user.family.id
    else
      return nil
    end
  end

  def my_children
    current_user.family.children if logged_in?
  end

  def logged_in
    redirect_to '/login' unless session.include? :user_id
  end
    
  def logged_in?
    !!current_user
  end 

  def omni_redirect 
    if current_user.title == nil
      redirect_to '/omniuser'
    elsif current_user.family_id == nil
       redirect_to '/omnifamily'
    elsif current_user.family.children.empty?
      redirect_to '/omnichild'
    end
  end

  def user_complete
    current_user && current_user.family && current_user.family.children
  end

  private

  def resolve_layout
    if !logged_in? || my_family == nil
      "welcome"
    else
      "application"
    end
  end
end