FROM ruby:2.2-slim

ENV DEBIAN_FRONTEND noninteractive
ENV VARDIR /app
ENV GIT_DIR $VARDIR

RUN useradd automation --shell /bin/bash --create-home

RUN apt-get -yqq update && \
    apt-get -yqq install \
    curl \
    unzip \
    zip \
    xvfb \
    tinywm \
    fonts-ipafont-gothic \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-scalable \
    xfonts-cyrillic \
    python \
    build-essential \
    libpq-dev \
    npm \
    nodejs \
    mysql-client \
    libcurl4-openssl-dev \
    git \
    imagemagick \
    libmagickcore-dev \
    libmagick++-dev \
    libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS -o - https://bootstrap.pypa.io/ez_setup.py | python && \
    easy_install -q supervisor

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install bower -g && \
    echo '{ "allow_root": true }' > /root/.bowerrc

RUN mkdir $VARDIR
WORKDIR $VARDIR
ADD Gemfile* $VARDIR/
ADD . $VARDIR

RUN bundle check || bundle install

