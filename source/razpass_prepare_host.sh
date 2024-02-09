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

echo -n "Set hostname to razpass... "
hostname razpass
echo "OK"

echo -n "Clear /etc/motd... "
echo > /etc/motd
echo "OK"

echo -n "Enable ssh server... "
systemctl enable ssh"
echo "OK"

echo -n "Enable ssh server... "
systemctl enable ssh
echo "OK"

echo -n "Create ad-hoc wifi network with password ${ADHOC_WIFI_PASSWORD}... "
nmcli device wifi hotspot ifname wlan0 ssid razpass password ${ADHOC_WIFI_PASSWORD}
echo "OK"

echo -n "Enable ad-hoc network as default on boot... "
nmcli connection modify Hotspot connection.autoconnect true
echo "OK"

