sudo iptables -F
sudo ip link del tap0

DEVICE_NAME="docker0"
sudo ip tuntap add tap0 mode tap # user $(id -u) group $(id -g)
sudo ip addr add 10.0.0.1/24 dev tap0
sudo ip link set tap0 up
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo iptables -t nat -A POSTROUTING -o $WIRELESS_DEVICE_NAME -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i tap0 -o $WIRELESS_DEVICE_NAME -j ACCEPT

