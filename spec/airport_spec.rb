require 'airport'

describe Airport do
  subject(:airport) {described_class.new }

  context 'plane location status' do
    it 'knows when a plane is flying' do
      plane = double :plane, location: 'flying'
      expect(airport.location_is(plane)).to eq 'flying'
    end

    it 'knows when a plane is at the airport' do
      plane = double :plane, location: 'airport'
      expect(airport.location_is(plane)).to eq 'airport'
    end
  end

  context 'deciding if plane can land or take off' do
    it 'can request a plane to take off' do
      expect(airport).to respond_to :order_takeoff
    end

    it 'can let a plane know if they can land' do
      expect(airport).to respond_to :order_land
    end
  end

  context 'weather conditions' do
    it 'can be sunny or stormy' do
      weather_conditions = []
      10.times {weather_conditions << airport.weather }
      expect(weather_conditions.uniq).to contain_exactly('sunny', 'stormy')
    end
    it 'does not let the plane land when the weather is stormy' do
      allow_any_instance_of(Airport).to receive(:weather).and_return(:'stormy')
      expect { (airport.order_land :plane) }.to raise_error 'landing permission denied'
    end
    it 'does not let the plane take off when the weather is stormy' do
      plane = Plane.new
      allow_any_instance_of(Airport).to receive(:weather).and_return(:'stormy')
      expect { (airport.order_takeoff :plane) }.to raise_error 'take off permission denied'
    end
  end
end
