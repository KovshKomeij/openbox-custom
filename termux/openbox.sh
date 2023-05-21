#!/bin/bash
clear
echo "Installing Openbox"
sleep 2
sudo apt update -y
apt install keyboard-configuration tzdata -y
apt install sudo wget dialog -y
apt install libexo-2-0 -y
apt install openbox obconf tigervnc-standalone-server wget nano dbus-x11 xorg xterm gpicview lxterminal pcmanfm tint2 firefox-esr policykit-1 lxpolkit mousepad lxappearance lxappearance-obconf lxrandr xarchiver lightdm abiword geany tigervnc-common -y
clear

wget https://raw.githubusercontent.com/dibil228of/openbox-custom/main/termux/vncserver-start -O /usr/local/bin/vncserver-start
wget https://raw.githubusercontent.com/dibil228of/openbox-custom/main/termux/vncserver-stop -O /usr/local/bin/vncserver-stop
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

adduser user

su -l user

mkdir -p ~/.vnc

echo "#!/bin/bash
[ -r ~/.Xresources ] && xrdb ~/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:1
XAUTHORITY=~/.Xauthority
export XAUTHORITY
dbus-launch openbox
dbus-launch xrandr -s 1280x720
dbus-launch pcmanfm --deskto
dbus-launch tint2
dbus-launch lxpolkit
chmod +x ~/.vnc/xstartup

echo "You can now start vncserver by running vncserver-start"
echo ""
echo "It will ask you to enter a password when first time starting it."
echo ""
echo "The VNC Server will be started at localhost:1"
echo ""
echo "You can connect to this address with a VNC Viewer you prefer"
echo ""
echo ""
echo ""
echo "Running vncserver-start"
echo ""
echo ""
echo ""
echo "To Kill VNC Server just run vncserver-stop"
echo ""
echo ""
echo ""

vncpasswd
vncserver-start
