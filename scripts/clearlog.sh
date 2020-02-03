#!/bin/bash

echo Preparing to clear logs
cd /root/Desktop/DSRT/
echo ==========================
echo Starting...
echo ==========================
echo Removing Kismet files
echo ==========================
cd kismet
rm LastFile/*
rm MoreFiles/*
rm DONOTDELETE/*
cd ..
echo Kismet files removed
echo ==========================
echo Removing Probequest files
echo ==========================
cd probequest
rm LastFile/*
rm MoreFiles/*
rm DONOTDELETE/*
cd ..
echo Probequest files removed
echo ==========================
echo Removing Airodump files
echo ==========================
cd airodump
rm LastFile/*
rm MoreFiles/*
rm DONOTDELETE/*
cd ..
echo Airodump files removed
echo ==========================
rm -rf ~/.local/share/Trash/*
echo All log files removed... Done
