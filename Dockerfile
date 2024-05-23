FROM ruby:alpine3.19 AS builder

ARG RAKE_ENV
ENV RAKE_ENV=$RAKE_ENV
ARG RAILS_ENV
ENV RAILS_ENV=$RAILS_ENV

RUN sudo apt-get install ruby-full rake \
        echo "gem: --user-install" > ~/.gemrc \
        export PATH=$PATH:/home/runner/.local/share/gem/ruby/3.0.0/bin \
        gem install bundler jekyll \
        bundle config path ~/.gem/ \
        bundle install \
        bundle exec jekyll build \


FROM scratch

COPY --from=builder ./_site/ .

