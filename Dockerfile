FROM ruby:2.5-rc-slim

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV INSTALL_PATH /kovle
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
RUN bundle install

COPY . .

RUN bundle exec rails RAILS_ENV=production DATABASE_URL=postgresql://kovle:downcase.rb!@127.0.0.1/dbname SECRET_TOKEN= assets:precompile

VOLUME ["$INSTALL_PATH/public"]

CMD bundle exec unicorn -c config/unicorn.rb