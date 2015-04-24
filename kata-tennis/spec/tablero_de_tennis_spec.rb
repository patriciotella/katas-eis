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

    partido.anotacion_jugador_uno

    partido.point_counter.should == [1,0]
    partido.get_resultado.should == "15,0"
  end

  it 'cuando el jugador 2 anota, se ve reflejado en el marcador' do

    partido.anotacion_jugador_dos

    partido.point_counter.should == [1,1]
    partido.get_resultado.should == "15,15"
  end
end