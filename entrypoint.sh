#!/bin/sh
echo "$CRON_SCHEDULE /usr/local/sbin/run_sync.sh" > /etc/crontabs/root

crond -f -l 2
