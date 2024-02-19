2024 Jens Heine <binbash@gmx.net>
https://github.com/binbash23/razpass/

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
I combined the password database software called [p](https://github.com/binbash23/p) with a customized raspberry pi zero 2w (I call it razpass). The result is a tiny device which contains all your passwords for use anywhere.
# Usage
You just plug in the razpass device into any usb plug to get power.
A wlan called "razpass" will appear soon. Then you connect to the wlan with your mobile (or any other device) and access the password database software with ssh (on the mobile I use "Termius").
For more detailed information, use the [wiki](https://github.com/binbash23/razpass/wiki).
It is possible to add your personal wifi network information to the razpass device. On startup it will at first search for these known wifi networks and connect to them before it finally starts its own ad-hoc wifi network. When the razpass connects to your personal wifi at home for example, you cann connect to it with ssh and the device will have internet access. When the razpass has to start its own ad-hoc wifi net, it has no internet access and you can not synchronize the password database to other locations. You can also not update the p software when you use the razpass in ad-hoc wifi mode for sure.
# Architecture Hotspot Mode
![Razpass Setup Hotspot](https://github.com/binbash23/razpass/blob/master/docs/razpass_setup_hotspot.png)
# Architecture Home WIFI Mode
![Razpass Setup WIFI](https://github.com/binbash23/razpass/blob/master/docs/razpass_setup_home_wifi.png)
# Connect from Windows/Terminal
![Razpass Connect from windows/terminal](https://github.com/binbash23/razpass/blob/master/docs/razpass_connect_from_windows.png)
# Connect from Android
![Razpass Connect from android](https://github.com/binbash23/razpass/blob/master/docs/razpass_connect_from_android.jpg)


