require 'airport'
require 'plane'
require 'weather'
describe Airport do
  let(:airport) { Airport.new}
  let(:plane) { Plane.new }

  context 'taking off and landing'

    it 'a plane can land' do
      expect(airport.plane_count).to eq(0)
      #land a plane
      airport.land_to_airport(plane.land!)
      expect(airport.plane_count).to eq(1)
      expect(plane).not_to be_flying
    end

    it 'a plane can take off' do
      puts airport.weather_generator?
      #allow(lambda { airport.land_to_airport(plane) }).to raise_error(RuntimeError, 'Airport is full')
      #land a plane
      airport.land_to_airport(plane.land!)
      expect(airport.plane_count).to eq(1)
      #take off a plane
      allow(airport).to receive(:weather_generator?).and_return(true)
      puts airport.weather_generator?
      airport.take_off_airport(plane)
      expect(airport.plane_count).to eq(0)
      expect(plane).to be_flying
    end 

    context 'traffic control' do

      it 'a plane cannot cannot land if the airport is full' do
        expect(airport).not_to be_full
        10.times { airport.land_to_airport(plane.land!) }
        expect(airport).to be_full
        expect(lambda { airport.land_to_airport(plane) }).to raise_error(RuntimeError, 'Airport is full')
      end

      context 'weather conditions' do

        it 'a plane cannot take off when there is a storm brewing' do
          allow(airport).to receive(:weather_generator?).and_return(false)
          expect(lambda { airport.take_off_airport(plane)}).to raise_error(RuntimeError, 'Storm is brewing')
          
        end





      end
    end
 end