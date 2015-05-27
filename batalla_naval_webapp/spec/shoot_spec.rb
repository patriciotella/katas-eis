require 'rspec'
require_relative '../app/models/battle_ship'

describe 'shoot' do

  before(:each) do
    @board = Board.new(5,5)
    @board.alocate_large_ship_in(3,3)
  end


  it 'shooting at position 3,3 the large ship gets hit' do

    expect(@board.shoot_position(3,3)).to eq("hit")

  end

  it 'shoot at position 3,2, since there is no ship there gets water ' do

    expect(@board.shoot_position(3,2)).to eq("water")

  end

  it 'shoot at position 3,4 hit de second part of the board and its sink ' do

    @board.shoot_position(3,3)
    expect(@board.shoot_position(3,4)).to eq("sink")

  end

end