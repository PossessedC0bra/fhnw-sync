FROM alpine

COPY fhnw_sync_functions.sh /usr/local/bin/
COPY run_sync.sh /usr/local/bin/

RUN mkdir /mnt/fhnw
RUN chmod +x /usr/local/bin/run_sync.sh
RUN echo '0 7-19 * * * /usr/local/bin/run_sync.sh' > /etc/crontabs/root
RUN apk add --no-cache openconnect cifs-utils

VOLUME /srv

CMD crond -f -l 2
