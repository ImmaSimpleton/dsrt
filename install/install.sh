#!/bin/bash
#
#This should install the DSRT on your device.
#
echo Installing Kismet
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -
echo 'deb https://www.kismetwireless.net/repos/apt/release/kali kali main' | sudo tee /etc/apt/sources.list.d/kismet.list
apt update -y
apt install kismet -y
echo done
echo ===========================
echo Installing gpsd
echo
apt install gpsd gpsd-clients -y
echo done
echo ===========================
echo Installing Probequest
echo
pip3 install --upgrade probequest
echo done
echo ===========================
echo Installing scripts to /bin/
cp ./scripts/*.sh /bin/
echo done
echo ===========================
echo Marking the scripts executable
sleep 1
chmod +x /bin/blaine.sh
chmod +x /bin/disableonboot.sh
chmod +x /bin/probehunt.sh
chmod +x /bin/startdtm.sh
chmod +x /bin/startonboot.sh
chmod +x /bin/stopdtm.sh
chmod +x /bin/zeroize.sh
chmod +x /bin/clearlog.sh
chmod +x /bin/airodump.sh
echo 
echo done
echo ===========================
echo Creating crontab for automove
sleep 1
echo
(crontab -l ; echo "@reboot /bin/blaine.sh") | crontab -
echo done
echo ===========================
echo Creating Desktop Icons
cp ./desktopIcons/*.desktop ~/Desktop
echo done
echo ===========================
echo Making Desktop Icons executable
chmod +x ~/Desktop/*.desktop
echo done
echo ===========================
echo Creating the services
cp ./services/probequest.service /etc/systemd/system/
cp ./services/airodump.service /etc/systemd/system/
cp ./services/kismet.service /lib/systemd/system/
echo done
echo ===========================
echo Configuring Kismet
cp -f ./programs/kismet/kismet.conf /etc/kismet/
cp -f ./programs/kismet/kismet_logging.conf /etc/kismet/
echo done
echo ===========================
echo Configuring gpsd
cp -f ./programs/gpsd/gpsd /etc/default/gpsd
echo done
echo ===========================
echo Configuring services
systemctl enable kismet
systemctl enable gpsd
systemctl enable probequest
systemctl enable airodump
echo done
echo ===========================
echo Creating Directories
mkdir -p ~/Desktop/DSRT/airodump/DONOTDELETE
mkdir -p ~/Desktop/DSRT/airodump/LastFile
mkdir -p ~/Desktop/DSRT/airodump/MoreFiles
mkdir -p ~/Desktop/DSRT/kismet/DONOTDELETE
mkdir -p ~/Desktop/DSRT/kismet/LastFile
mkdir -p ~/Desktop/DSRT/kismet/MoreFiles
mkdir -p ~/Desktop/DSRT/probequest/DONOTDELETE
mkdir -p ~/Desktop/DSRT/probequest/LastFile
mkdir -p ~/Desktop/DSRT/probequest/MoreFiles
mv ~/Desktop/install ~/Documents/*
