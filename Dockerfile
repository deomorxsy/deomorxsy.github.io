#FROM ruby:3.3.4-bookworm as builder
FROM debian:12.1 as builder
#FROM ruby:alpine3.19 AS builder

ARG RAKE_ENV
ENV RAKE_ENV=$RAKE_ENV
ARG RAILS_ENV
ENV RAILS_ENV=$RAILS_ENV

ARG RUBY_VERSION=3.1.0
ENV RUBY_VERSION=$RUBY_VERSION


WORKDIR /app
COPY . .


ARG APPLICATION_USER=appuser
ENV APPLICATION_USER=$APPLICATION_USER

RUN useradd --uid 1000 --create-home --shell /bin/bash $APPLICATION_USER && \
    chown -R $APPLICATION_USER:$APPLICATION_USER /app

#RUN adduser -u 1000 && \
#    mkdir -p /app && \
#    chown -R $APPLICATION_USER /app

RUN apt-get update && \
    apt-get install build-essential ruby-full rake -y

USER $APPLICATION_USER

RUN echo "gem: --user-install" > ~/.gemrc && \
    export PATH=$PATH:/home/$APPLICATION_USER/.local/share/gem/ruby/$RUBY_VERSION/bin && \
    cd /app/oldsite/ && \
    gem install bundler jekyll && \
    bundle config path ~/.gem/ && \
    bundle install && \
    bundle exec jekyll build

#RUN cat /root/.local/share/gem/ruby/3.1.0/extensions/x86_64-linux/3.1.0/ffi-1.17.0/mkmf.log

ENTRYPOINT ["/bin/sh"]

CMD ["jekyll", "serve"]

# =====================================

FROM alpine:3.20 as relay

COPY --from=builder /app/oldsite/_site .

#FROM scratch
#COPY --from=builder ./_site/ .

