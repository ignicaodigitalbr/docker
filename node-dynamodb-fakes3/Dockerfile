FROM ignicaodigital/node-dynamodb

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update && \
    apt-get install -y ruby && \
    gem install fakes3

EXPOSE 4567

ENTRYPOINT ["fakes3", "-r", "/mnt/fakes3_root", "-H", "s3.local", "-p", "4567"]
