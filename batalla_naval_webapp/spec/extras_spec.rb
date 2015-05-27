require 'rspec'
require_relative '../app/models/battle_ship'

describe 'extras' do

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