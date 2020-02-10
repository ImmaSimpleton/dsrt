#!/bin/bash
# Executing this will assign a vairable based on the number of files in the "morefiles" folder.
# After assigning the variable, it will move the file from the DONOTDELETE and rename it.

: << 'Commented out'
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
echo done.'
Commented out

# Calculate how many files are in the folder.

kismet_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c .kismet)
pcap_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c .pcap)
airodump_files = $( ls ~/Desktop/DSRT/Airodump/ | grep -c .csv)
probequest_files = $ ( ls ~/Desktop/DSRT/Probequest/ | grep -c .csv)

# Calculate how many files need to be renamed.

new_kismet_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c kismet.kismet)
new_pcap_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c kismet.pcap)
new_airodump_files = $( ls ~/Desktop/DSRT/Airodump/ | grep -c airodump.csv)
new_probequest_files = $( ls ~/Desktop/DSRT/Probequest/ | grep -c probes.csv)
# Moving the files if needed

# Kismet
cd ~/Desktop/DSRT/Kismet/
if [[ $kismet_files != 0 ]]; then
    if [[ $new_kismet_files != 0 ]]; then
        mv kismet.kismet $kismet_files.kismet
    fi
fi

# PCAP
cd ~/Desktop/DSRT/Kismet/ 
if [[ $pcap_files != 0 ]]; then
    if [[ $new_pcap_files != 0 ]]; then
        mv kismet.pcap $pcap_files.pcap
    fi
fi

# Airodump
cd ~/Desktop/DSRT/Airodump/
if [[ $airodump_files != 0 ]]; then
    if [[ $new_airodump_files != 0 ]]; then
        mv airodump.csv $airodumpfiles.csv
    fi
fi

# Probequest
cd ~/Desktop/DSRT/Probequest/
if [[ $probequest_files != 0 ]]; then
    if [[ $new_probequest_files !=0 ]]; then
        mv probes.csv $probequest_files.csv
    fi
fi

# Remove the kismet.journal file
rm ~/Desktop/DSRT/Kismet/*.kismet-journal

