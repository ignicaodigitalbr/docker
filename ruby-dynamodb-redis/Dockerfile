FROM ruby:2.3.2

#JAVA 7
RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade -y && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update && \
    apt-get -y install locales && \
    sed -i.bak -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL="en_US.UTF-8" && \
    export LANGUAGE=en_US:en && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get -y install oracle-java7-installer && \
    update-alternatives --display java && \
    apt-get -y install oracle-java7-set-default && \
    rm -fr /var/cache/oracle-jdk7-installer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
ENV LANGUAGE   en_US:en

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# REDIS
RUN apt-get update && \
    apt-get install -y redis-server --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# DynamoDB
RUN mkdir /var/dynamodb_wd /var/dynamodb_local

WORKDIR /var/dynamodb_wd

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar xfz dynamodb_local_latest.tar.gz

#Pip
RUN apt-get update && \
    apt-get install -y build-essential python-dev ruby-full zip --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  curl -O https://bootstrap.pypa.io/get-pip.py && \
  python get-pip.py && \
  pip install --upgrade awsebcli awscli boto3==1.3.0 && \
  aws configure set preview.cloudfront true && \
  rm -rf get-pip.py

EXPOSE 8000 6379

CMD ["service", "redis-server", "start"]

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "/var/dynamodb_wd/DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local", "-sharedDb", "-port", "8000"]
