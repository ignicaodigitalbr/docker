FROM ruby:2.3-alpine

# wget
RUN apk update 
RUN apk add ca-certificates wget 
RUN update-ca-certificates   

# Java 7
RUN apk add git tar openssh openjdk7 mksh socat
RUN apk add apache-ant --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN rm -rf /var/cache/apk/*

ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin

# redis 
RUN apk add --update redis && rm -rf /var/cache/apk/*

CMD ["redis-server", "/etc/redis.conf"]

# DynamoDB
RUN mkdir /var/dynamodb_wd /var/dynamodb_local

WORKDIR /var/dynamodb_wd

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar xfz dynamodb_local_latest.tar.gz

RUN /usr/bin/java -Djava.library.path=. -jar /var/dynamodb_wd/DynamoDBLocal.jar -dbPath /var/dynamodb_local -sharedDb -port 8000 &

#fakes3
RUN gem install fakes3
RUN fakes3 -r /mnt/fakes3_root -H s3.local -p 4567 &

# pip
RUN apk add --update python
RUN python -m ensurepip
RUN rm -r /usr/lib/python*/ensurepip
RUN pip install --upgrade pip setuptools
RUN rm -rf /var/cache/apk/*

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install --upgrade awsebcli awscli boto3==1.3.0 && \
    aws configure set preview.cloudfront true && \
    rm -rf get-pip.py

EXPOSE 6379 8000

ENTRYPOINT ["/bin/sh"] 
