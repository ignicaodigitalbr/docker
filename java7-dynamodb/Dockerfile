FROM ignicaodigital/java7

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /var/dynamodb_wd
WORKDIR /var/dynamodb_wd

RUN \
    wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar xfz dynamodb_local_latest.tar.gz

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "/var/dynamodb_wd/DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]
CMD ["-port", "8000", "--sharedDb"]

EXPOSE 8000