require_relative '../../../batalla_naval/app/models/battle_ship.rb'
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)


Given(/^a board with dimensions "(\d+)" x "(\d+)"$/) do |x, y|
  visit '/mipagina'
  fill_in 'xBoard' ,with: x
  fill_in 'yBoard' ,with: y
  find('#inciar_partida').click
  #click_button "inciar_partida"
  #@board = Board.new(x.to_i,y.to_i)
end

Given(/^I create a small ship in position "([^"]*)" :"([^"]*)"$/) do |x, y|
  fill_in 'xSmallCoord' , with:x
  fill_in 'ySmallCoord' , with:y
  #find('#add_small_ship').click
  click_button "add_small_ship"
  #fill_in(:xCoord, :with => x)
  #fill_in(:yCoord, :with => y)
  #click_button "inspect_coord"
  #@board.alocate_small_ship_in(x.to_i,y.to_i)
end

Then(/^position "([^"]*)":"([^"]*)" is not empty$/) do |x, y|
  fill_in(:xCoord, :with => x)
  fill_in(:yCoord, :with => y)
  click_button "inspect_coord"
  expect(page.has_content?(:coord_result)).should_not eq "water"
  expect(page.has_content?(y)).to eq true
  expect(@board.empty_position(x.to_i,y.to_i)).to eq(false)
end

Given(/^I create a large ship in position "([^"]*)":"([^"]*)"$/) do |x, y|
  fill_in(:xLargeCoord, :with => x)
  fill_in(:yLargeCoord, :with => y)
  click_button "add_large_ship"
  #@board.alocate_large_ship_in(x.to_i,y.to_i)
end