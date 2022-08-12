default:
	echo "if it's the first time, first run 'make setup', then 'make net' and then 'make run'"

setup:
	./Setup.sh

net:
	sudo ./Setup-network.sh

run:
	sudo ./Start.sh

clean:
	sudo rm -rf release* ubuntu-firecracker firecracker vmlinux image.ext4