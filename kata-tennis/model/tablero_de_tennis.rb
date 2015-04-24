class TableroDeTennis

  def initialize()
    @set_counter= [0,0]
    @game_counter= [0,0]
    @point_counter= [0,0]
  end

  def set_counter
    @set_counter
  end

  def game_counter
    @game_counter
  end

  def point_counter
    @point_counter
  end

  def anotacion_jugador_uno
    point_counter[0] = point_counter.first + 1
  end

  def anotacion_jugador_dos
    point_counter[1] = point_counter.last + 1
  end

  def pharse_tennis_score(point)
    case point
      when 0
        pharse = 0
      when 1
        pharse= 15
      when 2
        pharse= 30
      when 3
        pharse= 40
      else
        pharse= "definir advantage"
    end
    pharse
  end

  def get_resultado
    jugador_a = pharse_tennis_score point_counter[0]
    jugador_b= pharse_tennis_score point_counter[1]
    "#{jugador_a},#{jugador_b}"
  end

end