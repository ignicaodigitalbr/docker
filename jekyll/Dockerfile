FROM ruby:2.6-alpine

WORKDIR /app

COPY . /app

RUN apk update && apk add --no-cache \
      build-base \
      make

RUN bundle install

CMD jekyll serve

EXPOSE 4000
