FROM alpine

RUN apk add --no-cache openconnect cifs-utils
RUN echo '0 7-19 * * * /usr/local/bin/run.sh' > /etc/crontabs/root

COPY scripts/*.sh /usr/local/sbin/

VOLUME ["/srv"]

CMD ["crond", "-f", "-l", "2"]
