#! /usr/bin/bash

git clone https://github.com/bkleiner/ubuntu-firecracker && \
cd ubuntu-firecracker && \
docker build -t ubuntu-firecracker . && \
docker run --privileged -it --rm -v $(pwd)/output:/output ubuntu-firecracker && \
cd ..
