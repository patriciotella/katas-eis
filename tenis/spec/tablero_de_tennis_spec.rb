require 'rspec'
require_relative '../model/tablero_de_tennis.rb'

describe 'Tablero de Tennis, test pedidos' do

  partido = TableroDeTennis.new

  it 'deberia retornar todos los marcadores en 0 cuando inicia un juego' do

    partido.set_counter.should == [0,0]
    partido.game_counter.should == [0,0]
    partido.point_counter.should == [0,0]
  end

  it 'cuando el jugador 1 anota el primer punto deberia mostrarse en el marcador' do

    partido.anotacion_jugador 1

    partido.point_counter.should == [1,0]
    partido.get_resultado.should == "15,0"
  end

  it 'cuando el jugador 2 anota, se ve reflejado en el marcador' do

    partido.anotacion_jugador 2

    partido.point_counter.should == [1,1]
    partido.get_resultado.should == "15,15"
  end

  it 'cuando el jugador uno gana el game los puntos vuelven a 0-0 y se incremente el set counter' do

    partido.anotacion_jugador 1
    partido.anotacion_jugador 1
    partido.anotacion_jugador 1

    partido.game_counter.should == [1,0]
    partido.point_counter.should == [0,0]
    partido.get_resultado.should == "0,0"
  end

  it 'cuando el jugador uno gana 6 games gana el set y los games y puntos vuelven a 0' do

    n=0
    while (n<=19)
      partido.anotacion_jugador 1
      n+=1
    end

    partido.set_counter.should == [1,0]
    partido.game_counter.should == [0,0]
    partido.point_counter.should == [0,0]
  end

  it 'cuando el jugador uno gana 2 sets gana el partido e imprime en pantalla el ganador' do

    partido.set_jugador 1
    partido.set_jugador 1

    partido.set_counter.should == [0,0]
    partido.game_counter.should == [0,0]
    partido.point_counter.should == [0,0]
  end
end

describe 'testeo completo de funcionalidades' do

  otro_partido = TableroDeTennis.new

  it 'una vez iniciado el partido, testeo del punto a punto para el primer game' do
    otro_partido.anotacion_jugador 1
    otro_partido.anotacion_jugador 1

    otro_partido.point_counter.should == [2,0]
    otro_partido.get_resultado.should == "30,0"

    otro_partido.anotacion_jugador 2

    otro_partido.point_counter.should == [2,1]
    otro_partido.get_resultado.should == "30,15"

    otro_partido.anotacion_jugador 1
    otro_partido.anotacion_jugador 2

    otro_partido.point_counter.should == [3,2]
    otro_partido.get_resultado.should == "40,30"

    otro_partido.anotacion_jugador 1

    otro_partido.point_counter.should == [0,0]
    otro_partido.get_resultado.should == "0,0"
    otro_partido.game_counter.should == [1,0]

  end
  it 'testeo game a game hasta el primer set ganado' do

    otro_partido.game_jugador 2

    otro_partido.game_counter.should == [1,1]

    otro_partido.game_jugador 2
    otro_partido.game_jugador 2
    otro_partido.game_jugador 2
    otro_partido.game_jugador 2

    otro_partido.game_counter.should == [1,5]

    otro_partido.game_jugador 2

    otro_partido.game_counter.should == [0,0]
  end
end