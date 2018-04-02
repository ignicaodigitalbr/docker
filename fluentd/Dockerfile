FROM fluent/fluentd:v1.1.2

RUN fluent-gem install fluent-plugin-influxdb

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
