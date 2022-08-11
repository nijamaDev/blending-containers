#! /usr/bin/bash

# Remove the old socket and start the new one
rm -f /tmp/firecracker.socket
./firecracker --api-sock /tmp/firecracker.socket
