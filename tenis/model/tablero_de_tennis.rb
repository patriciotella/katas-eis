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

  def anotacion_jugador nro_de_jugador

    if point_counter[nro_de_jugador - 1] < 3
      #puts "es menor a 3"
      point_counter[nro_de_jugador - 1] = point_counter[nro_de_jugador - 1] + 1
    else
      if point_counter[0]==point_counter[1]
        #puts "estan iguales"
        point_counter[nro_de_jugador - 1] = point_counter[nro_de_jugador - 1] + 1
      else
        if tiene_ventaja(nro_de_jugador)
          #puts " no estan iguales y tiene ventaja"
          @point_counter = [0,0]
          game_jugador(nro_de_jugador)
        else
          #puts "no estan iguales y no tiene ventaja"
          point_counter[nro_de_jugador - 1] = point_counter[nro_de_jugador - 1] + 1
        end
      end
    end
  end

  def game_jugador(nro_de_jugador)

    if game_counter[nro_de_jugador - 1]< 5
      game_counter[nro_de_jugador - 1] = game_counter[nro_de_jugador - 1] + 1
    else
      @game_counter = [0,0]
      set_jugador(nro_de_jugador)
    end
  end

  def set_jugador(nro_de_jugador)

    if set_counter[nro_de_jugador - 1] <1
      set_counter[nro_de_jugador - 1] = set_counter[nro_de_jugador - 1] + 1
    else
      @set_counter = [0,0]
      puts "ganador jugador #{nro_de_jugador}!!!"

    end
  end

  def pharse_tennis_score(point)
    case point
      when 0
        pharse = 0
      when 1
        pharse= 15
      when 2
        pharse= 30
      else
        pharse= 40
    end
    pharse
  end

  def get_resultado
    jugador_a = pharse_tennis_score point_counter[0]
    jugador_b= pharse_tennis_score point_counter[1]
    if point_counter[0] >= 3 && point_counter[1] >= 3
      if tiene_ventaja(1)
        resultado = "ventaja jugador 1"
      else
        if tiene_ventaja(2)
          resultado ="ventaja jugador 2"
        else
          resultado= "#{jugador_a},#{jugador_b}"
        end
      end
    else
      resultado= "#{jugador_a},#{jugador_b}"
    end
    resultado
  end

  def tiene_ventaja(nro_de_jugador)
    if point_counter[0]==point_counter[nro_de_jugador-1]
      ventaja = point_counter[0]= point_counter[1] + 1
    else
      ventaja = point_counter[1]= point_counter[0] + 1
    end
    ventaja
  end

end