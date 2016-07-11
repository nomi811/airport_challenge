require_relative 'plane'

class Airport

  def location_is(plane)
    plane.location
  end

  def order_takeoff(plane)
    plane.takeoff
  end

  def order_land(plane)
    plane.land self
  end

  def weather
    'sunny'
  end
end
