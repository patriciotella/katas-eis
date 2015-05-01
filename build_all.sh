#!/usr/bin/env sh
set -e
bundle install
cd char_counter
bundle exec rake
cd ..
cd tenis
cd ..
cd batalla_naval
bundle exec rake
