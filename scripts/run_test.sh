#!/bin/sh

# Install nodejs 16.x
curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install nodejs

# Install rails
gem install rails bundler

# Install gems
bundle install

# Prepare db
rails db:prepare RAILS_ENV=test

rails db:migrate RAILS_ENV=test

# Run tests
rails test
