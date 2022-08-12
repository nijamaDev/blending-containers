TAP_NAME=veth0
DEVICE_NAME=wlo1

sudo ip link del $TAP_NAME

sudo ip tuntap add $TAP_NAME mode tap # user $(id -u) group $(id -g)
sudo ip addr add 172.17.100.1/24 dev $TAP_NAME
sudo ip link set $TAP_NAME up
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo iptables -t nat -A POSTROUTING -o $DEVICE_NAME -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $TAP_NAME -o $DEVICE_NAME -j ACCEPT
