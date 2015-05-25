class CellItem

  def get_data
  end

  def shoot_position
  end

end

class Water < CellItem

  def get_data
    "water"
  end

  def shoot_position
    "water"
  end

end

class SmallShip < CellItem

  def get_data
    "SmallShip"
  end

end

class LargeShip < CellItem

  def initialize(front,back)
    @front = front
    @back = back
    @hits=0
  end

  def shoot_position
    @hits+=1
    get_status
  end

  def get_data
    "LargeShip"
  end

  def get_status
    case @hits
      when 0
        status = "ok"
      when 1
        status = "hit"
      else
        status = "sink"
    end
    status
  end
end