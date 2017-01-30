FROM ignicaodigital/java7

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /var/dynamodb_wd
WORKDIR /var/dynamodb_wd

RUN \
    apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y build-essential nodejs git

RUN \
    wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar xfz dynamodb_local_latest.tar.gz

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "/var/dynamodb_wd/DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]
CMD ["-port", "8000"]

EXPOSE 8000

VOLUME ["/var/dynamodb_local", "/var/dynamodb_wd"]
