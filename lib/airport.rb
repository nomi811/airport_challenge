require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 6

  def initialize
    @capacity = DEFAULT_CAPACITY
  end

  def location_is(plane)
    plane.location
  end

  def order_takeoff(plane)
    fail 'take off permission denied' unless weather_good?
    plane.takeoff

  def order_land(plane)
    fail 'landing permission denied' unless weather_good? || can_land?
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
    landed_planes.length < @capacity
  end
end
