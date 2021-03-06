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

Given(/^a large ship in position: "([^"]*)":"([^"]*)"$/) do |x, y|
  fill_in(:xLargeCoord, :with => x)
  fill_in(:yLargeCoord, :with => y)
  click_button "add_large_ship"
end

Given(/^I shoot to position "([^"]*)":"([^"]*)"$/) do |x, y|
  visit '/juegoiniciado'
  fill_in(:xShootCoord, :with => x)
  fill_in(:yShootCoord, :with => y)
  click_button "shoot"
end

Then(/^I get hit$/) do
  expect(page).to have_content("hit")
end

Then(/^I get water$/) do
  expect(page).to have_content("water")
end

Then(/^I get sink$/) do
  visit '/juegoiniciado'
  fill_in(:xShootCoord, :with => 3)
  fill_in(:yShootCoord, :with => 3)
  click_button "shoot"
  expect(page).to have_content("sink")
end

