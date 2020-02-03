#!/bin/bash
#
echo Disabling DTM services
echo ===========================
systemctl disable kismet
systemctl disable probequest
systemctl disable airodump
echo Enabling Network Manger
echo ===========================
systemctl enable NetworkManager
echo Done.
sleep 3
