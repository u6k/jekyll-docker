FROM ruby:latest
MAINTAINER u6k <u6k.apps@gmail.com>

RUN gem install jekyll bundler

VOLUME /var/myblog

WORKDIR /var/myblog

EXPOSE 4000
