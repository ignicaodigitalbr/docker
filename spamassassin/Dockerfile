FROM debian:jessie-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -yq spamassassin 

RUN groupadd spamassassin && \
    useradd -g spamassassin -s /bin/false -d /var/log/spamassassin spamassassin && \
    mkdir -p /var/log/spamassassin && \
    chown -R spamassassin:spamassassin /var/log/spamassassin

ADD local.cf /etc/spamassassin/local.cf

CMD ["spamd", "--create-prefs", "-i", "0.0.0.0", "--allowed-ips", "0.0.0.0/0"]
