require 'airport'

describe Airport do
  subject(:airport) {described_class.new }
  it 'knows when a plane is flying' do
    plane = double :plane, location: 'flying'
    expect(airport.location(plane)).to eq 'flying'
  end

  it 'knows when a plane is at the airport' do
    plane = double :plane, location: 'airport'
    expect(airport.location(plane)).to eq 'airport'
  end
end
