#!/bin/sh

# Install nodejs 16.x
curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install nodejs

# Install rails
gem install rails bundler

# Install gems
bundle install

# Prepeare db
rails db:prepare
rails db:migrate

# Run a shell
ruby bin/rails server -b 0.0.0.0
