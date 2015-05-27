require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")
require_relative '../../app/app.rb'
require 'capybara/cucumber'
require 'rspec/expectations'

# Capybara.default_driver = :selenium
Capybara.app = Battleship::App.tap { |app|  }