FROM ruby:2.3-alpine

RUN apk add --no-cache \
    tzdata build-base nodejs \
    postgresql-client postgresql-dev \
    cmake bash git curl \
    wget python python-dev

RUN apk update && \
    apk add --no-cache ca-certificates wget && \
    update-ca-certificates

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install --upgrade awsebcli awscli boto3==1.3.0 && \
    aws configure set preview.cloudfront true && \
    rm -rf get-pip.py
