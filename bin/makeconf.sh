#!/bin/bash

# Get environment variables
. ./ks_environment.sh

IP_ADDRESS=`nslookup -sil $1.cs.ucdavis.edu 2> /dev/null | head -5 | tail -1 | awk '{ print $2 }'`

x=`echo $IP_ADDlESS | sed 's/^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+$//'`
if [ ! -z "$x" ]; then
    echo IP address lookup for host $1 failed. 2>&1
    exit 1
fi

if [ -f /tmp/ks.cfg ]; then
    rm -f /tmp/ks.cfg
fi

# Do search and replaces
cat kickstart |\
sed 's,<IP_ADDRESS>,'$IP_ADDRESS',' |\
sed 's,<ISO_SERVER>,'$ISO_SERVER',' |\
sed 's,<ISO_PATH>,'$ISO_PATH',' |\
sed 's,<SUBNET_MASK>,'$SUBNET_MASK',' |\
sed 's,<GATEWAY>,'$GATEWAY',' |\
sed 's,<NAME_SERVER>,'$NAME_SERVER',' |\
sed 's,<NIS_SERVER>,'$NIS_SERVER',' |\
sed 's,<NIS_DOMAIN>,'$NIS_DOMAIN',' > /tmp/ks.cfg

# Append rest of info
cat ks_environment.sh >> /tmp/ks.cfg
cat post_install >> /tmp/ks.cfg

cp /tmp/ks.cfg .

if [ -f /tmp/ks.cfg ]; then
    rm -f /tmp/ks.cfg
fi
echo "Finish making kickstart disk for $1."

