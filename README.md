# razpass
razpass is a project that provides a secure password store with it's own dedicated hardware.
This password store can be used completely offline. 

# The Idea
* Get access to your passwords even offline
* Do not use a password manager from google or apple or any other company
* Use open source password safe software
* Keep the password safe software off any mobile
* Store your passwords decentralized
* Synchronize your password database to multiple secure locations

# The Solution
I combined the password database software called [p](https://github.com/binbash23/p), that I wrote by myself, with a customized raspberry pi zero 2w (I call it razpass). The result is a tiny device which contains all your passwords for use anywhere.
# Usage
You just plug in the razpass device into any usb plug to get power.
A wlan called "razpass" will appear soon. Then you connect to the wlan with your mobile (or any other device) and access the password database software with ssh (on the mobile I use "Termius").
For more detailed information, use the [wiki](https://github.com/binbash23/razpass/wiki).
