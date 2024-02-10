#!/bin/bash
#
# 202402 Jens Heine <binbash@gmx.net>
#
# razpass_prepare_p_user.sh - Prepare the environment for the p user on the
# raspberry pi for usage with the p password program.
#
# This script must be run as p user on the raspberry pi.
#
set -e

echo "Create ~/bin folder..."
mkdir ~/bin

echo "Copy useful bash scripts into ~/bin..."
cp -v home_p_bin/* ~/bin

echo "Create p program folder... "
mkdir ~/p
cd ~/p

echo "Download p from github... "
wget https://github.com/binbash23/p/raw/master/dist/raspberry/p

echo "Make p executeable... "
chmod +x ./p

echo "Create and prepare .ssh folder in home dir... "
cd ~
mkdir .ssh
chmod 700 .ssh/

echo "Prepare ~/.bash_profile to run p on login... "
cat > ~/.bash_profile << EOF
# Source .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc

# export ~/bin to PATH
export PATH="/home/p/bin:\$PATH"

# when bash starts as a login shell: run p on login and exit the bash when p exists:
cd ~/p
echo "Please wait..."
./p
exit

EOF

