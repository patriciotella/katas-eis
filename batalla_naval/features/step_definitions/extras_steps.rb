#require_relative '../../app/models/battle_ship.rb'
#require 'uri'
#require 'cgi'
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

#module WithinHelpers
#  def with_scope(locator)
#    locator ? within(locator) { yield } : yield
#  end
#end
#World(WithinHelpers)

#Given(/^I create a large ship in position "([^"]*)":"([^"]*)"$/) do |x, y|
  #begin
  #  fill_in(:xLargeCoord, :with => x)
  #  fill_in(:yLargeCoord, :with => y)
  #  click_button "add_large_ship"
  #rescue InvalidLocation => @exc
  #end
#end

#Then(/^it will raise an error "([^"]*)"$/) do |exception_message|
 # expect(@exc.message).to eq(exception_message)
#end

#Given(/^I shoot to position "([^"]*)":"([^"]*)"$/) do |x, y|
#  begin
#    @board.shoot_position(x.to_i,y.to_i)
#  rescue InvalidLocation => @exc
#  end
#end