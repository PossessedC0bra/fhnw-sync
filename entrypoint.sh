#!/bin/sh
echo '0 7-19 * * * /usr/local/sbin/run_sync.sh' > /etc/crontabs/root

crond -f -l 2
