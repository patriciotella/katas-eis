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
    ""
  end

end

class LargeShip < CellItem

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