#!/bin/bash
# Executing this will assign a vairable based on the number of files in the "morefiles" folder.
# After assigning the variable, it will move the file from the DONOTDELETE and rename it.

# Calculate how many files are in the folder.

kismet_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c .kismet)
pcapng_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c .pcapng)
pcapppi_file = $( ls ~/Desktop/DSRT/Kismet/ | grep -c .pcapppi)
airodump_files = $( ls ~/Desktop/DSRT/Airodump/ | grep -c .csv)
probequest_files = $ ( ls ~/Desktop/DSRT/Probequest/ | grep -c .csv)

# Calculate how many files need to be renamed.

new_kismet_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c kismet.kismet)
new_pcapng_files = $( ls ~/Desktop/DSRT/Kismet/ | grep -c kismet.pcapng)
new_pcapppi_files = $( ls ~/Desktop/DSRT/Kismet/ grep -c kismet.pcapppi)
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

# PCAPNG
cd ~/Desktop/DSRT/Kismet/ 
if [[ $pcapng_files != 0 ]]; then
    if [[ $new_pcapng_files != 0 ]]; then
        mv kismet.pcapng $pcapng_files.pcapng
    fi
fi

#PCAPPPI
cd ~/Desktop/DSRT/Kismet/                                                                                                               
if [[ $pcapppi_files != 0 ]]; then                                         
    if [[ $new_pcapppi_files != 0 ]]; then                                 
        mv kismet.pcapppi $pcapppi_files.pcapng                                 
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

# Converting .kismet files into something more useful
cd ~/Desktop/DSRT/Kismet/
if [[ $new_kismet_files != 0 ]];then
    #kml
    kismetdb_to_kml --in $kismet_files.kismet --out $kismetfiles.kml 2> /dev/null
    #wigle csv
    kismetdb_to_wiglecsv --in $kismet_files.kismet --out $kismetfiles'wigle'.csv 2> /dev/null
    #csv
    kismet_log_to_csv --in $kismet_files.kismet --out $kismetfiles.csv 2> /dev/null
fi

# Cleaning up converted files

cd ~/Desktop/DSRT/Kismet/
if [[ $new_kismet_files != 0 ]]; then
    mv *.csv /csv
    mv *.kml /kml
fi
