require_relative '../models/cell_item.rb'
require_relative '../models/battle_ship_ex.rb'

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

  def belong_to_board(x,y)
    @x>x && @y>y
  end

  def alocate_small_ship_in(x,y)
    if belong_to_board(x,y)
      @cells[x-1][y-1]= SmallShip.new
    else
      raise InvalidLocation
    end
  end

  def alocate_large_ship_in(x,y)
    if belong_to_board(x,y)
      large_ship = LargeShip.new([x-1,y-1],[x-1,y])
      @cells[x-1][y-1]= large_ship
      @cells[x-1][y] = large_ship
    else
      raise InvalidLocation
    end
  end

  def shoot_position (x,y)
    if belong_to_board(x,y)
      @cells[x-1][y-1].shoot_position
    else
      raise InvalidLocation
    end
  end

end