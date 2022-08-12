#! /usr/bin/bash

# Set the ethernet bridge connection

# Configure the host’s tap devices

## Enable ip_forward = 1
#   sudo sysctl -w net.ipv4.ip_forward=1

## Create tap named tapvm1
#   sudo ip tuntap add tapvm1 mode tap

## Add an address to tapvm1
#   sudo ip addr add 10.0.0.1/24 dev tapvm1

## Start the new tap interface
#   sudo ip link set tapvm1 up

## To handle routing we can make use of IP tables and a few rules.
#   sudo iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE
#   sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#   sudo iptables -A FORWARD -i tapvm1 -o wlo1 -j ACCEPT
curl \
  --unix-socket /tmp/firecracker.socket \
  -X PUT 'http://localhost/network-interfaces/eth0' \
  -H 'accept:application/json' \
  -H 'content-type:application/json' \
  -d '{
    "iface_id": "eth0",
    "guest_mac": "AA:FC:00:00:00:01",
    "host_dev_name": "tap0"
  }'