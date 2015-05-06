require_relative '../../model/battle_ship'

Given(/^I create a large ship in position "([^"]*)" :"([^"]*)"$/) do |x, y|
  begin
  @board.alocate_large_ship_in(x.to_i,y.to_i)
  rescue InvalidLocation => @exc
  end
end

Then(/^it will raise an error "([^"]*)"$/) do |exception_message|
  expect(@exc.message).to eq(exception_message)
end