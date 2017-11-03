FROM debian:jessie-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -yq spamassassin 

ADD local.cf /etc/spamassassin/local.cf

CMD ["spamd", "--create-prefs", "-i", "0.0.0.0", "--allowed-ips", "0.0.0.0/0"]
