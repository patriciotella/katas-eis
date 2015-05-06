class Board

  def initialize(x,y)
    @cells =Array.new(x) {Array.new(y) {Water.new}}
  end

  def get_data_of(x,y)
    @cells[x][y].get_data
  end

  def empty_position (x,y)
    @cells[x][y].instance_of?Water
  end

  def alocate_small_ship_in(x,y)
    @cells[x][y]= SmallShip.new
  end

  def alocate_large_ship_in(x,y)
    large_ship = LargeShip.new([x,y],[x,y+1])
    @cells[x][y]= large_ship
    @cells[x][y+1] = large_ship
  end

  def shoot_position (x,y)
    @cells[x][y].shoot_position
  end
end

class Water

  def get_data
    "water"
  end

end

class SmallShip

  def get_data
    ""
  end

end

class LargeShip

  def initialize(front,back)
    @front = front
    @back = back
  end

  def shoot_position
    "hit"
  end

  def get_data
    ""
  end

end