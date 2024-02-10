#!/bin/bash
#
# 202402 Jens Heine <binbash@gmx.net>
#
# razpass_prepare_host.s - Prepare the razpass host.
#
# This script must be run as root user on the raspberry pi.
#
set -e
ADHOC_WIFI_PASSWORD='razpassrazpass'

echo "Set hostname to razpass... "
hostname razpass

echo "Clear /etc/motd... "
echo > /etc/motd

echo "Enable ssh server... "
systemctl enable ssh

echo "Enable ssh server... "
systemctl enable ssh

echo "Create ad-hoc wifi network with password ${ADHOC_WIFI_PASSWORD}... "
nmcli device wifi hotspot ifname wlan0 ssid razpass password ${ADHOC_WIFI_PASSWORD}

echo "Enable ad-hoc network as default on boot... "
nmcli connection modify Hotspot connection.autoconnect true
nmcli connection modify Hotspot 802-11-wireless.powersave 2

echo "Create the p user..."
useradd -m p

echo "Set a password for the p user to login..."
passwd p

echo "Enable sudo withoput password for p user..."
echo "p ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/010_p-nopasswd


