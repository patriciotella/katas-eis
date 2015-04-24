require 'rspec'
require_relative '../model/tablero_de_tennis.rb'

describe 'Tablero de Tennis' do

  it 'deberia retornar todos los marcadores en 0 cuando inicia un juego' do

    partido = TableroDeTennis.new
    partido.set_counter.should == [0,0]
    partido.game_counter.should == [0,0]
    partido.point_counter.should == [0,0]
  end
end