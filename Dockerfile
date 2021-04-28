FROM alpine

RUN apk add --no-cache openconnect cifs-utils

COPY *.sh /
COPY scripts/*.sh /usr/local/sbin/

VOLUME ["/srv"]

HEALTHCHECK CMD ["/healthcheck.sh"]

ENTRYPOINT ["/entrypoint.sh"]
