FROM node:latest

RUN apt-get update && \
    apt-get install -y openjdk-7-jre-headless build-essential python-dev ruby-full --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py && \
    pip install awscli && \
    aws configure set preview.cloudfront true

RUN mkdir /app

WORKDIR /app

RUN gem install s3_website

RUN npm install -g yarn

ENTRYPOINT ["/bin/bash"]
