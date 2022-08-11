#! /usr/bin/bash

# Set the ethernet bridge connection
curl -X PUT \
  --unix-socket /tmp/firecracker.socket \
  http://localhost/network-interfaces/eth0 \
  -H accept:application/json \
  -H content-type:application/json \
  -d '{
    "iface_id": "eth0",
    "host_dev_name": "veth0"
}'