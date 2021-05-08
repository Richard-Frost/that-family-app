class ApplicationController < ActionController::Base

  layout :resolve_layout

  before_action :current_user
  before_action :my_children
	helper_method :current_user, :my_family, :logged_in?, :joined?, :my_children, :everyone_attending?, :playdates_near_me, :families_near_me, :omni_redirect

private 

  def current_user
	  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def age 
    binding.pry 
    @age = current_user.family.children.age 
    @age.to_time
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

  def logged_in?
    #return head(:forbidden) unless session.include? :user_id
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

  def playdates_near_me
    geo = Geocoder.search(current_user.family.zipcode.to_i).first
    lat = geo.latitude
    lon = geo.longitude
    distance = 5
    center_point = [lat, lon]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    Playdate.within_bounding_box(box)
  end

  def families_near_me
    geo = Geocoder.search(current_user.family.zipcode.to_i).first
    lat = geo.latitude
    lon = geo.longitude
    distance = 5
    center_point = [lat, lon]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    Family.within_bounding_box(box)
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

layout :resolve_layout

  private

  def resolve_layout
    if !logged_in? || my_family == nil
      "welcome"
    else
      "application"
    end
  end
 
end