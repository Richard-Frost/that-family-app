module PlaydatesHelper

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

  def my_playdate
     @playdate.originator == current_user.id
  end

end
