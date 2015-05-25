require 'rspec'
require_relative '../app/models/battle_ship'

describe 'Board' do

  before(:each) do
    @board = Board.new(5,5)
  end


  it'given a board(5x5) should should contain cells from (1..5,1..5)' do

    expect(@board.get_data_of(1,1)).to eq("water")
    expect(@board.get_data_of(3,4)).to eq("water")
    expect(@board.empty_position(3,4)).to eq(true)
    #testear todos con un for each

  end

  it'given a small ship in position 1,1 then the data of the cells is not empty' do

    @board.alocate_small_ship_in(1,1)

    expect(@board.get_data_of(1,1)).not_to eq("water")

  end

  it 'given a large ship in position 1,1 and 1,2 then the data of the cells is not empty' do

    @board.alocate_large_ship_in(1,1)

    expect(@board.get_data_of(1,1)).not_to eq("water")
    expect(@board.get_data_of(1,2)).not_to eq("water")

  end
end

describe 'Game Choices' do

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

describe 'Extras' do

  before(:each) do
    @board = Board.new(5,5)
  end

  it'try to alocate a ship in a invalid location and raise an exception_message' do

    expect{@board.alocate_large_ship_in(3,5)}.to raise_exception InvalidLocation

  end

  it'try to shoot in a invalid location and raise an exception_message' do

    expect{@board.shoot_position(3,5)}.to raise_exception InvalidLocation

  end

end