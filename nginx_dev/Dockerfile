FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils

ENV RAILS_ROOT /var/www/app

WORKDIR $RAILS_ROOT

RUN mkdir log

COPY public public/

COPY nginx.conf /tmp/app.nginx

RUN envsubst '$RAILS_ROOT' < /tmp/app.nginx > /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
