# Dockerfile.rails
FROM ruby:3.1.2 AS rails-toolbox

# Copy local files
RUN mkdir /app
WORKDIR /app
COPY . /app

# Install nodejs 16.x
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install nodejs

# Install rails
RUN gem install rails bundler

# Install gems
RUN bundle install

# Prepeare db
RUN rails db:prepare
RUN rails db:migrate

# Run a shell
CMD ["ruby bin/rails server -b 0.0.0.0"]
