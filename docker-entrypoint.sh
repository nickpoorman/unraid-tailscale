#!/bin/ash

export PATH=$PATH:/usr/local/bin

set -e

if [ ! -d /dev/net ]; then
    mkdir -p /dev/net
fi
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

# Start the daemon
tailscaled &

# Let it get connected to the control plane
sleep 10

# Start the interface
tailscale up ${UP_FLAGS:-}

# Do nothing until the end of time
sleep infinity

