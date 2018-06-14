FROM docker.elastic.co/logstash/logstash:6.2.4

RUN /usr/share/logstash/bin/logstash-plugin install logstash-output-influxdb

CMD ["/usr/share/logstash/bin/logstash"]
