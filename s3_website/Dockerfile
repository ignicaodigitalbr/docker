FROM node:latest

RUN apt-get update && \
   apt-get install -y openjdk-7-jre-headless build-essential ruby-full

RUN mkdir /app

WORKDIR /app

RUN gem install s3_website

RUN npm install -g yarn

ENTRYPOINT ["s3_website"]

CMD ["--help"]
