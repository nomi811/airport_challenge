require_relative 'plane'

class Airport

  def location_is(plane)
    plane.location
  end

  def order_takeoff(plane)
    fail 'take off permission denied' unless weather_good?
    plane.takeoff self
  end

  def order_land(plane)
    fail 'landing permission denied' unless weather_good?
    fail 'airport full, landing permission denied' unless can_land?
    plane.land self
  end

  def weather
    ['sunny', 'stormy'].sample
  end

  private

  def weather_good?
    weather == 'sunny'
  end

  def can_land?

  end
end
