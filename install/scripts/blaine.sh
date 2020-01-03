#!/bin/bash
# This script is named after Blaine Rodda, who gave me the idea of the concept. 
# Executing this will assign a vairable based on the number of files in the "morefiles" folder.
# After assigning the variable, it will move the file from the DONOTDELETE and rename it.

mv /root/Desktop/DSRT/kismet/LastFile/*.kismet /root/Desktop/DSRT/kismet/DONOTDELETE/
mv /root/Desktop/DSRT/kismet/LastFile/*.pcapng /root/Desktop/DSRT/kismet/DONOTDELETE/
mv /root/Desktop/DSRT/probequest/LastFile/*.csv /root/Desktop/DSRT/probequest/DONOTDELETE/
mv /root/Desktop/DSRT/airodump/LastFile/*.csv /root/Desktop/DSRT/airodump/DONOTDELETE/
echo ============================
echo Starting renaming process.
echo ============================
numbercsv=$( ls /root/Desktop/DSRT/probequest/MoreFiles/ | grep -c .csv )
sleep 1
echo probes done
echo ============================
numberkis=$( ls /root/Desktop/DSRT/kismet/MoreFiles/ | grep -c .kismet )
sleep 1 
echo .kismet done
echo ============================
numberpcap=$( ls /root/Desktop/DSRT/kismet/MoreFiles/ | grep -c .pcap ) 
sleep 1
echo .pcap done
echo ============================
numberair=$( ls /root/Desktop/DSRT/airodump/MoreFiles/ | grep -c .csv )
sleep 1
echo airodump done
echo ============================
echo variables assigned
echo ============================
sleep 1
echo moving files
echo ============================
mv /root/Desktop/DSRT/probequest/DONOTDELETE/probes.csv /root/Desktop/DSRT/probequest/MoreFiles/$numbercsv'probes.csv'	
mv /root/Desktop/DSRT/kismet/DONOTDELETE/*.kismet /root/Desktop/DSRT/kismet/MoreFiles/$numberkis'.kismet'
mv /root/Desktop/DSRT/kismet/DONOTDELETE/*.pcapng /root/Desktop/DSRT/kismet/MoreFiles/$numberpcap'.pcapng'
mv /root/Desktop/DSRT/airodump/DONOTDELETE/airodump-01.csv /root/Desktop/DSRT/airodump/MoreFiles/$numberair'airodump.csv'
echo files moved.
echo ============================
echo deleting .kismet-journal files
rm /root/Desktop/DSRT/kismet/LastFile/*.kismet-journal
echo done.
