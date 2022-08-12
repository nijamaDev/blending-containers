sudo iptables -F
sudo ip link del veth0

DEVICE_NAME="docker0"
sudo ip tuntap add veth0 mode tap # user $(id -u) group $(id -g)
sudo brctl addif docker0 veth0
sudo ip link set veth0 up

