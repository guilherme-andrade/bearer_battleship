FROM ruby:2.7.5-buster
ARG APP_NAME=battleship
ARG APP_DIR=app
ARG PORT=3000

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV BUNDLE_WITHOUT test:production

LABEL Name=$APP_NAME Version=0.0.1

RUN apt-get update && apt-get -yq dist-upgrade \
    && apt-get install -qqy --no-install-recommends \
    build-essential \
    curl \
    file \
    git \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - 
RUN apt-get update && apt-get install -qqy --no-install-recommends \
    nodejs \
    && apt-get clean

EXPOSE $PORT
WORKDIR /$APP_DIR

RUN npm install yarn -g

RUN gem install bundler:2.2.25
RUN bundle config --global frozen 1

COPY Gemfile* /$APP_DIR/
COPY package.json /$APP_DIR/
RUN bundle install

CMD rm -f /app/tmp/pids/server.pid && rails s -b 0.0.0.0
