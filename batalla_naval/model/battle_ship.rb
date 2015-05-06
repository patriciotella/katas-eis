require_relative '../../batalla_naval/model/cell_item'
require_relative '../../batalla_naval/model/battle_ship_ex'

class Board

  def initialize(x,y)
    @x=x
    @y=y
    @cells =Array.new(x) {Array.new(y) {Water.new}}
  end

  def get_data_of(x,y)
    @cells[x-1][y-1].get_data
  end

  def empty_position (x,y)
    @cells[x-1][y-1].instance_of?Water
  end

  def alocate_small_ship_in(x,y)
    @cells[x-1][y-1]= SmallShip.new
  end

  def alocate_large_ship_in(x,y)
    if (@x>x && @y>y)
      large_ship = LargeShip.new([x-1,y-1],[x-1,y])
      @cells[x-1][y-1]= large_ship
      @cells[x-1][y] = large_ship
    else
      raise InvalidLocation
    end
  end

  def shoot_position (x,y)
    @cells[x-1][y-1].shoot_position
  end

end