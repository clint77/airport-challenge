require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new}
  let(:plane) { Plane.new }

  context 'taking off and landing'

    it 'a plane can land' do
      expect(airport.plane_count).to eq(0)
      #land a plane
      airport.land_to_airport(plane)
      expect(airport.plane_count).to eq(1)
    end

    # it 'a plane can take off' do

    # end
  end
# end