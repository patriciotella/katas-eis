require_relative '../../app/models/battle_ship.rb'
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
  click_button "inciar_partida"
end

Given(/^I create a small ship in position "([^"]*)":"([^"]*)"$/) do |x, y|
  fill_in 'xSmallCoord' , with:x
  fill_in 'ySmallCoord' , with:y
  click_button "add_small_ship"
end

Then(/^position "([^"]*)":"([^"]*)" is not empty$/) do |x, y|
  visit '/mipagina'
  fill_in 'xCoord', with:x
  fill_in 'yCoord', with:y
  click_button "inspect_coord"
  expect(page).to have_content("water")
end

Given(/^I create a large ship in position "([^"]*)":"([^"]*)"$/) do |x, y|
  #visit '/mipagina'
  fill_in(:xLargeCoord, :with => x)
  fill_in(:yLargeCoord, :with => y)
  click_button "add_large_ship"
end