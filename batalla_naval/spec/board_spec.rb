require 'rspec'
require_relative '../model/board.rb'

describe 'Board' do

  board = Board.new(5,5)

  it'given a board(5x5) should should contain cells from (1..5,1..5)' do

    expect(board.get_data_of(1,1)).to eq("water")
    expect(board.get_data_of(3,4)).to eq("water")
    expect(board.empty_position(3,4)).to eq(true)
    #testear todos con un for each

  end

  it'given a small ship in position 1,1 then the data of the cells is not empty' do

    board.alocate_small_ship_in(1,1)

    expect(board.get_data_of(1,1)).not_to eq("water")

  end

  it 'given a large ship in position 1,1 and 1,2 then the data of the cells is not empty' do

    board.alocate_large_ship_in(1,1)

    expect(board.get_data_of(1,1)).not_to eq("water")
    expect(board.get_data_of(1,2)).not_to eq("water")

  end
end