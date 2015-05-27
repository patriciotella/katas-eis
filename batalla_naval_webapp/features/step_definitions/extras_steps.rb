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

Then(/^it will raise an error for out of board location$/) do
  visit '/juegoiniciado'
  fill_in(:xLargeCoord, :with => 3)
  fill_in(:yLargeCoord, :with => 5)
  click_button "add_large_ship"
  expect(page).to have_content("location is out of board")
end

Then(/^it will raise an error for shooting out of the board$/) do
  visit '/juegoiniciado'
  fill_in(:xShootCoord, :with => 3)
  fill_in(:yShootCoord, :with => 5)
  click_button "shoot"
  expect(page).to have_content("location is out of board")
end