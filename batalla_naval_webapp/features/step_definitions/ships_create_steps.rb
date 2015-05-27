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