from ruby:latest

RUN gem install fakes3 -v 0.2.4

RUN mkdir /buckets

WORKDIR /buckets

EXPOSE 80

CMD ["fakes3", "--root=/buckets", "--port=80"]
