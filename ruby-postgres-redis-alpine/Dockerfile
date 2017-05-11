FROM ruby:2.3.1-alpine

# Install system dependencies 
RUN apk update && \
    apk add --no-cache \
    openssh tzdata git make redis \
    python python-dev build-base bash \
    postgresql=9.5.6-r0 \
    postgresql-dev=9.5.6-r0 \
    postgresql-contrib=9.5.6-r0

RUN apk update && \
    apk add --no-cache ca-certificates wget && \
    update-ca-certificates

CMD ["redis-server", "/etc/redis.conf"]

# Install pip
RUN python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools awscli boto3==1.3.0 && \
    aws configure set preview.cloudfront true


EXPOSE 3000 6379 5432

ENTRYPOINT ["/bin/sh"] 
