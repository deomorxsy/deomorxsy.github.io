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
    apt-get install build-essential ruby-full rake nodejs -y

USER $APPLICATION_USER

RUN echo "gem: --user-install" > ~/.gemrc && \
    export PATH=$PATH:/home/$APPLICATION_USER/.local/share/gem/ruby/$RUBY_VERSION/bin && \
    cd /app/oldsite/ && \
    gem install bundler jekyll && \
    bundle config path ~/.gem/ && \
    bundle install && \
    bundle exec jekyll build


#bundle exec jekyll serve && \
#JEKYLL_PID=$! && \
#sleep 8 && \
#kill $JEKYLL_PID && \
#cd -

#RUN cat /root/.local/share/gem/ruby/3.1.0/extensions/x86_64-linux/3.1.0/ffi-1.17.0/mkmf.log

EXPOSE 8080

# ENTRYPOINT ["/bin/sh"]
# CMD ["jekyll", "serve"]



# =====================================

# FROM alpine:3.20 as relay

FROM nginx:1.27.5-alpine AS relay

RUN apk upgrade && apk update && apk add dumb-init

COPY --from=builder /app/oldsite/_site .
COPY --from=builder /app/oldsite/_site /usr/share/nginx/html

EXPOSE 80

# ENTRYPOINT ["/docker-entrypoint.sh"]
# CMD ["nginx", "-g", "daemon off;"]

# podman build -t gembag:04 -f=./Dockerfile
# podman run --rm -it -p 8080:80 $CONTAINER_IMAGE_NAME

#FROM scratch
#COPY --from=builder ./_site/ .

