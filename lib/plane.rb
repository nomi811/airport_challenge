class Plane
  attr_reader :status, :location

  def initialize
    @status = 'flying'
  end

  def location
    @status == 'flying' ? 'air' : 'airport'
  end

  def request_takeoff(airport)
    airport.order_takeoff self
  end

  def request_landing(airport)
    airport.order_land self
  end

  def land(airport)
    fail 'already landed' if @status == 'landed'
    @status = 'landed'
  end

  def takeoff(airport)
    @status = 'flying'
  end
end
