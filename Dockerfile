FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /books-api
WORKDIR /books-api
COPY Gemfile /books-api/Gemfile
COPY Gemfile.lock /books-api/Gemfile.lock
RUN bundle install
COPY . /books-api

