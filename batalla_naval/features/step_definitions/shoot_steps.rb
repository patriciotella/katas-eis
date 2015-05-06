require_relative '../../model/battle_ship'

Given(/^a large ship in position: "([^"]*)":"([^"]*)"$/) do |x, y|
  @board.alocate_large_ship_in(x.to_i,y.to_i)
end

Given(/^I shoot to position "([^"]*)":"([^"]*)"$/) do |x, y|
  @result = @board.shoot_position(x.to_i,y.to_i)
end

Then(/^I get hit$/) do
  expect(@result).to eq("hit")
end

Then(/^I get water$/) do
  expect(@result).to eq("water")
end

Then(/^I get sink$/) do
  expect(@result).to eq("sink")
end


