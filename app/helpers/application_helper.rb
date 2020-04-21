module ApplicationHelper
	
	def logged_in?
    session[:user_id]
  end

  def my_children
    current_user.family.children
  end
end
