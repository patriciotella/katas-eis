require_relative '../../model/battle_ship'

Given(/^a board with dimensions "(\d+)" x "(\d+)"$/) do |x, y|
  @board = Board.new(x.to_i,y.to_i)
end

Given(/^I create a small ship in position "([^"]*)" :"([^"]*)"$/) do |x, y|
  @board.alocate_small_ship_in(x.to_i,y.to_i)
end

Then(/^position "([^"]*)":"([^"]*)" is not empty$/) do |x, y|
  expect(@board.empty_position(x.to_i,y.to_i)).to eq(false)
end

Given(/^I create a large ship in position "([^"]*)":"([^"]*)"$/) do |x, y|
  @board.alocate_large_ship_in(x.to_i,y.to_i)
end