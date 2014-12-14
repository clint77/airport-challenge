class Plane

  def initialize
    take_off!
  end

  def land!
    @flying =false
    self
  end

  def take_off!
    @flying = true
    self
  end

  def flying?
    @flying 
  end

end
