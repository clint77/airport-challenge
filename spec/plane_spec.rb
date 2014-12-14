require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'it has a flying status when in the air' do
    expect(plane.take_off!).to be_flying
  end

  it 'can take off' do
    plane.land!
    expect(plane.take_off!).to be_flying
  end

end