#!/bin/bash

/usr/lib/foundationdb/fdbmonitor --conffile  ${FDB_CONFIGURATION_FILE:-/etc/foundationdb/foundationdb.conf} --lockfile /var/run/fdbmonitor.pid

