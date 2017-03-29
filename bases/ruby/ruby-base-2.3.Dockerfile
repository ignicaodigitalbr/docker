FROM ruby:2.3-alpine

RUN apk add -qU openssh

RUN mkdir /app /root/.ssh

WORKDIR /app

RUN ssh-keyscan -H bitbucket.org >> /root/.ssh/known_hosts && \
    chmod 0644 /root/.ssh/known_hosts

EXPOSE 3000

ENTRYPOINT ["/bin/sh"]
