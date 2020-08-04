#!/bin/bash

set -o errexit
set -o nounset

cmd="$*"

export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin

if [ ! -e /dev/net/tun ]; then
        echo "ERROR: Can't start ZeroTier: /dev/net/tun is not present."
        exit 1
fi

# Start ZeroTier as daemon
/usr/sbin/zerotier-one -d
# Wait a few seconds for ZeroTier to get ready
sleep 3

# Join the network(s)
for ID in $(echo $NETWORK_ID | tr "," "\n")
do
    echo "Joining network $NETWORK_ID ..."
    zerotier-cli join $ID
done

# Execute the command for the container app
exec $cmd