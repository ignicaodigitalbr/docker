FROM ruby:2.4.1-alpine

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
    openssh tzdata git make \
    python python-dev build-base bash \
    postgresql \
    postgresql-dev \
    postgresql-contrib \
    imagemagick

RUN apk update && \
    apk add --no-cache ca-certificates wget && \
    update-ca-certificates

# Install pip
RUN python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools awscli boto3==1.3.0 && \
    aws configure set preview.cloudfront true

EXPOSE 3000

ENTRYPOINT ["/bin/sh"]
