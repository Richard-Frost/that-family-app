module FamiliesHelper

  def user_name(user)
      user.first_name.capitalize + " " + user.last_name.capitalize 
  end

  def child_name(child)
    child.first_name.capitalize 
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
end
