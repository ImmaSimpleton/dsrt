#!/bin/bash
#
#This should install the DSRT on your device.
#
#Installing kismet
echo Installing Kismet
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -
echo 'deb https://www.kismetwireless.net/repos/apt/release/kali kali main' | sudo tee /etc/apt/sources.list.d/kismet.list
apt update -y
apt install kismet -y
echo done
echo ===========================
echo
sleep 3

#Installing gpsd
echo Installing gpsd
echo
apt install gpsd gpsd-clients -y
echo done
echo ===========================
echo
sleep 3

#Installing Probequest
echo Installing Probequest
echo
apt install python3-pip && pip3 install --upgrade probequest
echo done
echo ===========================
echo 
sleep 3

#Installing Zenity
echo Installing Zenity
apt install zenity -y
echo done
echo ==========================
echo 
sleep 3

#Installing python log libraries
echo Installing python libraries
pip3 install kismetdb
echo done
echo =========================
echo 
sleep 3

#Copying scripts to /bin/
echo Installing scripts to /bin/
cp ./scripts/*.sh /bin/
echo done
echo ===========================
echo 
sleep 3

#Creating a crontab to move files in directories out of the way
#This has been replaced to be apart of a service to improve functionality
#echo Creating crontab for automove
#sleep 1
#echo
#(crontab -l ; echo "@reboot /bin/mvfiles.sh") | crontab -
#echo done
#echo ===========================

#Copying the desktop items over
echo Creating Desktop Icons
cp ./desktopIcons/*.desktop ~/Desktop
echo done
echo ===========================
echo 
sleep 3

#Making the desktop icons executable
echo Making Desktop Icons executable
chmod +x ~/Desktop/*.desktop
echo done
echo ===========================
echo 
sleep 3

#Copying the services over
echo Creating the services
cp ./services/probequest.service /etc/systemd/system/
cp ./services/airodump.service /etc/systemd/system/
cp ./services/kismet.service /lib/systemd/system/
echo done
echo ===========================
echo 
sleep 3

#Configuring kismet
echo Configuring Kismet

#Modifying the conf file to specify wlan0 and to use gpsd from device. 
sed -i 's/# source=wlan0 /source=wlan0/g' /etc/kismet/kismet.conf
sed -i 's/# gps=gpsd/gps=gpsd/g' /etc/kismet/kismet.conf
#cp -f ./programs/kismet/kismet.conf /etc/kismet/

#Directing the log files to the appropriate spot and to spit out a pcap
sed -i 's|log_prefix=./|log_prefix=/root/Desktop/DSRT/Kismet/|g' /etc/kismet/kismet_logging.conf
sed -i 's/log_types=kismet/log_types=kismet,pcapng,pcapppi/g' /etc/kismet/kismet_logging.conf
sed -i 's|log_template=%p/%n-%D-%t-%i.%l|log_template = kismet|g' /etc/kismet/kismet_logging.conf
#cp -f ./programs/kismet/kismet_logging.conf /etc/kismet/
echo done
echo ===========================
echo 
sleep 3

#Telling gpsd to use the /dev/ttyUSB0
echo Configuring gpsd

#Replacing the old copy config way with a stream editor config
#cp -f ./programs/gpsd/gpsd /etc/default/gpsd
sed -i 's|DEVICES=""|DEVICES="dev/ttyUSB0"|g' /etc/default/gpsd
echo done
echo ===========================
echo 
sleep 3

#enabling services
echo Configuring services
systemctl enable kismet
systemctl enable gpsd
systemctl enable probequest
systemctl enable airodump
echo done
echo ===========================
sleep 3

#Creating the directories for file storage
echo Creating Directories
mkdir -p ~/Desktop/DSRT/Kismet
mkdir -p ~/Desktop/DSRT/Kismet/csv
mkdir -p ~/Desktop/DSRT/Kismet/kml
mkdir -p ~/Desktop/DSRT/Airodump
mkdir -p ~/Desktop/DSRT/Probequest
echo done
echo ==========================
sleep 10

