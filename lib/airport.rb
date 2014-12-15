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

  def land_to_airport(plane)
    raise 'Airport is full' if full?
    plane.land!
    planes << plane
  end

  def take_off_airport(plane)
    #raise 'Storm is brewing' if weather_stormy?
    raise 'Storm is brewing' if !weather_generator?
      plane.take_off!
      planes.delete(plane)
    
  end

  def full?
    plane_count == 10
  end

  def capacity(planes)
    @capacity = planes
  end

  def weather_generator?
    if rand(1..10) < 8
      then true
      else false
    end
  end


end