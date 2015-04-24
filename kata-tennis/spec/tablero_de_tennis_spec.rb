require 'rspec'
require_relative '../model/tablero_de_tennis.rb'

describe 'Tablero de Tennis' do

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
    partido.anotacion_jugador 1

    partido.game_counter.should == [1,0]
    partido.point_counter.should == [0,0]
    partido.get_resultado.should == "0,0"
  end
end