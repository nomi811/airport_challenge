require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it 'checks to see if the plane is flying' do
    expect(plane.status).to eq 'flying'
  end
  it 'checks to see if the location of the plane is in the air' do
    expect(plane.location).to eq 'air'
  end
end
