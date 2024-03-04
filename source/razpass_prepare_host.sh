#!/bin/bash
#
# 202402 Jens Heine <binbash@gmx.net>
#
# razpass_prepare_host.s - Prepare the razpass host.
#
# This script must be run as root user on the raspberry pi.
#
#set -e

[ `whoami` != "root" ] && { echo "You are not the root user. You should run this script like this sudo $0"; exit 1; }


ADHOC_WIFI_PASSWORD='razpassrazpass'

echo "Set hostname to razpass... "
hostnamectl set-hostname razpass

echo "Set swap file"
sed  -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/g' /etc/dphys-swapfile
service dphys-swapfile restart
service dphys-swapfile status
free -m

echo "Clear /etc/motd... "
echo > /etc/motd

echo "Enable and start ssh server... "
systemctl enable ssh
systemctl start ssh

echo "Create ad-hoc wifi network with password '${ADHOC_WIFI_PASSWORD}'... "
nmcli device wifi hotspot ifname wlan0 con-name Hotspot ssid razpass password "${ADHOC_WIFI_PASSWORD}"

echo "Enable ad-hoc network as default on boot... "
nmcli connection modify Hotspot connection.autoconnect true

echo "Disable power save feature on wifi..."
nmcli connection modify Hotspot 802-11-wireless.powersave 2

echo "Create the p user..."
useradd -m p

echo "Set a password for the p user to login..."
passwd p

echo "Enable sudo without password for p user and set permissions of file..."
cat > /etc/sudoers.d/010_p-nopasswd << EOF
# 2024 Jens Heine <binbash@gmx.net>
# razpass - Enable su without password for the p user
p ALL=(ALL) NOPASSWD: ALL
EOF
chmod 0440 /etc/sudoers.d/010_p-nopasswd

echo "Enable dns to resolv razpass in Hotspot mode..."
cat > /etc/NetworkManager/dnsmasq-shared.d/razpass.conf << EOF
# 2024 Jens Heine <binbash@gmx.net>
# razpass - dns resolution for the razpass name in Hotspot mode
address=/razpass/10.42.0.1
EOF

#echo "Install some stuff..."
#apt-get install sqlite3

echo ">>> DONE <<<"

