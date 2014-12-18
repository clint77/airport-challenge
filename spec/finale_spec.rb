require 'finale'
require 'airport'
require 'plane'

describe Finale do

  let(:plane){Plane.new}
  let(:airport){Airport.new}

  
  it 'all planes can land and all planes can take off' do
    allow(airport).to receive(:weather_storm_generator?).and_return(true)
    6.times { airport.accept_landing(plane) }
    expect(plane).not_to be_flying
    expect(airport.plane_count).to eq 6
    6.times { airport.take_off_airport(plane) }
    expect(plane).to be_flying
    expect(airport.plane_count).to eq 0
  end
  
  # it 'can land all 6 plane' do
  #   airport = Airport.new
  #   plane = Plane.new
  #   allow(airport).to receive(:weather_storm_generator?).and_return(true)
  #   airport.accept_landing(plane)
  #   expect(airport.).to eq 6
  # end

  # it 'can take off all plane when airport is full' do

  # end

end