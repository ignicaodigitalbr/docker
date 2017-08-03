FROM ruby:2.3-alpine

ENV VARDIR /app
ENV GIT_DIR $VARDIR

RUN apk update && \
    apk add --no-cache \
    bash \
    git \
    build-base \
    openssh-client \
    libxml2-dev \
    libxml2-utils \
    libxslt \
    libxslt-dev

RUN mkdir $VARDIR
WORKDIR $VARDIR
ADD Gemfile* $VARDIR/
ADD . $VARDIR

RUN bundle check || bundle install
RUN gem install bundler
