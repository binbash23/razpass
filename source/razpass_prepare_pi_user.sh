#!/bin/bash
#
# 202402 Jens Heine <binbash@gmx.net>
#
# razpass_prepare_pi_user.sh - Prepare the environment for the pi user on the
# raspberry pi for usage with the p password program.
#
# This script must be run as pi user on the raspberry pi.
#
set -e

#echo -n "Set the password for the pi user: "
#passwd

echo -n "Make sure that we are in the /home/pi folder... "
cd /home/pi
echo "OK"

echo -n "Create p program folder... "
mkdir p
cd p
echo "OK"

echo -n "Download p from github... "
wget https://github.com/binbash23/p/raw/master/dist/raspberry/p
echo "OK"

echo -n "Make p executeable... "
chmod +x p
echo "OK"

echo -n "Create and prepare .ssh folder in home dir... "
cd ~
mkdir .ssh
chmod 700 .ssh/
echo "OK"

echo -n "Make p executeable... "
chmod +x p
echo "OK"


echo -n "Make p executeable... "
chmod +x p
echo "OK"

echo -n "Prepare ~/.bash_profile to run p on login... "
cat >> ~/.bash_profile << EOF
# when bash starts as a login shell: run p on login and exit the bash when p exists:
cd p
echo "Please wait..."
./p
exit
EOF
echo "OK"

