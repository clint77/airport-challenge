require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new}
  let(:plane) { Plane.new }

  context 'taking off and landing'

    it 'a plane can land' do
      expect(airport.plane_count).to eq(0)
      allow(airport).to receive(:weather_storm_generator?).and_return(true)
      airport.accept_landing(plane)
      expect(airport.plane_count).to eq(1)
      expect(plane).not_to be_flying
    end

    it 'a plane can take off' do
      allow(airport).to receive(:weather_storm_generator?).and_return(true)
      airport.accept_landing(plane)
      expect(airport.plane_count).to eq(1)
      airport.take_off_airport(plane)
      expect(airport.plane_count).to eq(0)
    end 

    context 'traffic control' do

      it 'a plane cannot land if the airport is full' do
        allow(airport).to receive(:weather_storm_generator?).and_return(true)
        expect(airport).not_to be_full
        10.times { airport.accept_landing(plane) }
        expect(airport).to be_full
        expect(lambda { airport.accept_landing(plane) }).to raise_error(RuntimeError, 'Airport is full')
      end

      context 'weather conditions' do

        it 'a plane cannot take off when there is a storm brewing' do
          allow(airport).to receive(:weather_storm_generator?).and_return(false)
          expect(lambda { airport.take_off_airport(plane)}).to raise_error(RuntimeError, 'Storm is brewing')
          
        end

        it 'a plane cannot land in the middle of a storm' do
          allow(airport).to receive(:weather_storm_generator?).and_return(false)
          expect(lambda { airport.accept_landing(plane)}).to raise_error(RuntimeError, 'Plane cannot land due to stormy weather')
        end



      end
    end
 end