class ApplicationController < ActionController::Base
	helper_method :current_user, :my_family, :logged_in?, :joined?, :my_children, :everyone_attending?
private 

  def current_user
	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def my_family
    current_user.family.id
  end

  def my_children
    current_user.family.children 
  end

  def logged_in?
    !!current_user
  end 

   def joined?
   my_kids_that_joined = []
   
     my_children.each do |kid| 
      participant = @playdate.participants.where(child_id: "#{kid.id}")
      my_kids_that_joined << participant unless participant.empty?
    end
    return my_kids_that_joined
  end

  def everyone_attending?
    my_children.count == joined?.count
  end

 
end