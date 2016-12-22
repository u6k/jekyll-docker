FROM ruby:latest
MAINTAINER u6k <u6k.apps@gmail.com>

RUN apt-get update

RUN apt-get install -y openjdk-7-jre

RUN gem install jekyll bundler

VOLUME /var/myblog

WORKDIR /var/myblog

EXPOSE 4000
