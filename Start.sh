#! /usr/bin/bash

( \
  sleep 1 && sudo Scripts/02_set-guest-kernel.sh && \
  sleep 1 && sudo Scripts/03_set-guest-rootfs.sh && \
  sleep 1 && Scripts/04_set-guest-eth0.sh   && \
  sleep 1 && Scripts/05_set-cpu-n-mem.sh    && \
  sleep 1 && Scripts/06_start-guest-machine.sh \
) & \
Scripts/01_start-socket.sh
