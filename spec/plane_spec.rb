require 'plane'

describe Plane do
  subject(:plane) { described_class.new }


  context 'flying tests' do
    it 'checks to see if the planes are flying' do
      expect(plane.status).to eq 'flying'
    end
    it 'checks to see if the location of the planes are in the air' do
      expect(plane.location).to eq 'air'
    end
  end

  context 'landing tests' do
    it 'checks to see if the planes can land' do
      airport = double :airport, order_land: true
      expect(plane.request_landing(airport)).to eq true
    end
    it 'checks to see if the planes have landed' do
      plane.land :airport
      expect(plane.status).to eq 'landed'
    end

  end
end
