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