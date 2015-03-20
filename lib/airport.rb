require_relative 'weather.rb'

class Airport

  include WeatherForecast

  capacity = 10

  def planes
    @plane ||= []  

  end

  def plane_count
    planes.count
  end

  def accept_landing(plane)
    raise 'Airport is full' if full?
    raise 'Plane cannot land due to stormy weather' if !weather_storm_generator?
    plane.land!
    planes << plane
  end

  def take_off_airport(plane)
    raise 'Storm is brewing' if !weather_storm_generator?
      plane.take_off!
      planes.delete(plane)
  end

  def full?
    plane_count == 10
  end

  def capacity(planes)
    @capacity = planes
  end

end