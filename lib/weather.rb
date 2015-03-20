module WeatherForecast

  def weather_storm_generator?
    if rand(1..10) < 8
      then true
      else false
    end
  end
end