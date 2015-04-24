#!/usr/bin/env sh
set -e
bundle install
cd char_counter
cd kata-tennis
bundle exec rake
