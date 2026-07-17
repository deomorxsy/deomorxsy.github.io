#!/bin/sh

# Set environment
RAKE_ENV=$RAKE_ENV
RAILS_ENV=$RAILS_ENV
RUBY_VERSION=3.1.0
APPLICATION_USER=appuser

# Set function so it can return
setup() {
mkdir -p /app/oldsite

# Create user
useradd --uid 1000 --create-home --shell /bin/bash $APPLICATION_USER && \
    chown -R $APPLICATION_USER:$APPLICATION_USER /app

# Install ruby and rake dependencies
apt-get update && \
apt-get install build-essential ruby-full rake nodejs -y


su "${APPLICATION_USER}" -c '
# Build project
echo "gem: --user-install" > ~/.gemrc && \
    export PATH=$PATH:/home/$APPLICATION_USER/.local/share/gem/ruby/$RUBY_VERSION/bin && \
    cd /app/oldsite/ || return && \
    gem install bundler jekyll && \
    bundle config path ~/.gem/ && \
    bundle install && \
    bundle exec jekyll build
'

}

setup

