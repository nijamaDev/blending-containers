#! /usr/bin/bash
# Download binary
release_url="https://github.com/firecracker-microvm/firecracker/releases"
latest=$(basename $(curl -fsSLI -o /dev/null -w  %{url_effective} ${release_url}/latest))
arch=`uname -m`
curl -L ${release_url}/download/${latest}/firecracker-${latest}-${arch}.tgz \
| tar -xz

# Rename it
mv release-${latest}-$(uname -m)/firecracker-${latest}-$(uname -m) firecracker