class Airport

  def planes
    @plane ||= []  

  end

  def plane_count
    planes.count
  end

  def land_to_airport(plane)
    planes << plane
  end

  def take_off_airport(plane)
    planes.delete(plane)
  end
end