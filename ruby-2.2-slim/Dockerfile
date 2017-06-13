FROM ruby:2.2-slim

RUN apt-get update && \
    apt-get install -yq \
    git build-essential ca-certificates \
    libcurl3-dev mysql-client imagemagick \
    libmagickcore-dev libmagickwand-dev \
    libmysqlclient-dev npm nodejs && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile .
COPY Gemfile.lock .

RUN gem install zeus

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install bower -g && \
    echo '{ "allow_root": true }' > /root/.bowerrc

RUN bundle install --jobs=8
