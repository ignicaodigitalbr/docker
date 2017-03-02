FROM ruby:2.3-alpine

# System dependencies 
RUN apk update && \
    apk add ca-certificates tzdata wget redis git build-base python tar openssh openjdk7 mksh socat && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates   

# Java 7
RUN apk add apache-ant --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    rm -rf /var/cache/apk/*

ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin

# redis 
CMD ["redis-server", "/etc/redis.conf"]

# DynamoDB
RUN mkdir /var/dynamodb_wd /var/dynamodb_local && \
    cd /var/dynamodb_wd && \
    wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar xfz dynamodb_local_latest.tar.gz && \
    rm -f dynamodb_local_latest.tar.gz

RUN /usr/bin/java -Djava.library.path=. -jar /var/dynamodb_wd/DynamoDBLocal.jar -dbPath /var/dynamodb_local -sharedDb -port 8000 &

# pip
RUN python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools awsebcli awscli boto3==1.3.0 && \
    aws configure set preview.cloudfront true && \

#fakes3
RUN gem install fakes3 && \
    fakes3 -r /mnt/fakes3_root -H s3.local -p 4567 &

EXPOSE 4567 6379 8000

ENTRYPOINT ["/bin/sh"] 
