FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /api
WORKDIR /api
COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock
RUN mkdir -p /api/log && touch /api/log/development.log
RUN gem install bundler:2.3.24
RUN bundle install
COPY . /api
RUN gem install foreman