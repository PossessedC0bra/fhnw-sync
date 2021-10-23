FROM alpine

RUN apk add --no-cache openconnect cifs-utils

COPY *.sh /
COPY scripts/*.sh /usr/local/sbin/

VOLUME ["/srv"]

ENV CRON_SCHEDULE="0 7-19 * * *"

HEALTHCHECK CMD ["/healthcheck.sh"]

ENTRYPOINT ["/entrypoint.sh"]
