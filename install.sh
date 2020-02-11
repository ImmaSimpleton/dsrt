#!/bin/bash
#
#This should install the DSRT on your device.
#
#Installing kismet
echo Installing Kismet
echo
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -
echo 'deb https://www.kismetwireless.net/repos/apt/release/kali kali main' | sudo tee /etc/apt/sources.list.d/kismet.list
apt update -y
apt install kismet -y
echo ===========================
sleep 3
echo done
echo

#Installing gpsd
echo Installing gpsd
echo
apt install gpsd gpsd-clients -y
echo ===========================
sleep 3
echo done
echo

#Installing Probequest
echo Installing Probequest
echo
apt install python3-pip && pip3 install --upgrade probequest
echo ==========================
sleep 3
echo done
echo

#Installing Zenity
echo Installing Zenity
echo
apt install zenity -y
echo ==========================
sleep 3
echo done
echo 

#Installing python log libraries
echo Installing python libraries
echo
pip3 install kismetdb
echo =========================
sleep 3
echo done
echo 

#Copying scripts to /bin/
echo Installing scripts to /bin/
echo
cp ./scripts/*.sh /bin/
echo ===========================
sleep 3
echo done
echo

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
echo
cp ./desktopIcons/*.desktop ~/Desktop
echo ===========================
sleep 3
echo done
echo

#Making the desktop icons executable
echo Making Desktop Icons executable
echo
chmod +x ~/Desktop/*.desktop
echo ===========================
sleep 3
echo done
echo

#Copying the services over
echo Creating the services
echo
cp ./services/probequest.service /etc/systemd/system/
cp ./services/airodump.service /etc/systemd/system/
cp ./services/kismet.service /lib/systemd/system/
echo ===========================
sleep 3
echo done
echo

#Configuring kismet
echo Configuring Kismet

#Modifying the conf file to specify wlan0 and to use gpsd from device. 
sed -i 's/# source=wlan0 /source=wlan0/g' /etc/kismet/kismet.conf
sed -i 's/# gps=gpsd/gps=gpsd/g' /etc/kismet/kismet.conf

#Directing the log files to the appropriate spot and to spit out a pcap
sed -i 's|log_prefix=./|log_prefix=/root/Desktop/DSRT/Kismet/|g' /etc/kismet/kismet_logging.conf
sed -i 's/log_types=kismet/log_types=kismet,pcapng,pcapppi/g' /etc/kismet/kismet_logging.conf
sed -i 's|log_template=%p/%n-%D-%t-%i.%l|log_template = kismet|g' /etc/kismet/kismet_logging.conf
echo ===========================
sleep 3
echo done 
echo

#Telling gpsd to use the /dev/ttyUSB0
echo Configuring gpsd
echo
sed -i 's|DEVICES=""|DEVICES="dev/ttyUSB0"|g' /etc/default/gpsd
echo ===========================
sleep 3
echo done
echo 

#enabling services
echo Configuring services
echo
systemctl enable kismet
systemctl enable gpsd
systemctl enable probequest
systemctl enable airodump
echo ===========================
sleep 3
echo done
echo

#Creating the directories for file storage
echo Creating Directories
echo
mkdir -p ~/Desktop/DSRT/Kismet
mkdir -p ~/Desktop/DSRT/Kismet/csv
mkdir -p ~/Desktop/DSRT/Kismet/kml
mkdir -p ~/Desktop/DSRT/Airodump
mkdir -p ~/Desktop/DSRT/Probequest
echo ==========================
echo done
sleep 10

