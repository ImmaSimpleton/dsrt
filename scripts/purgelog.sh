#!/bin/bash

echo Preparing to clear logs
cd /root/Desktop/DSRT/
echo ==========================
echo Starting...
echo ==========================
echo Removing Kismet files
echo ==========================
cd Kismet
#rm LastFile/*
#rm MoreFiles/*
#rm DONOTDELETE/*
rm ./* 2> /dev/null
rm /csv/*
rm /kml/*
cd ../Probequest
echo Kismet files removed
echo ==========================
echo Removing Probequest files
echo ==========================
#rm LastFile/*
#rm MoreFiles/*
#rm DONOTDELETE/*
rm ./*
cd ../Airodump
echo Probequest files removed
echo ==========================
echo Removing Airodump files
echo ==========================
#rm LastFile/*
#rm MoreFiles/*
#rm DONOTDELETE/*
rm ./*
echo Airodump files removed
echo ==========================
rm -rf ~/.local/share/Trash/* 2> /dev/null
echo All log files removed... Done
sleep 7
