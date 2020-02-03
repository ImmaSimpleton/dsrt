#!/bin/bash
#
echo Disabling Network Manager
echo ===========================
systemctl disable NetworkManager.service
echo Enabling DTM services
echo ===========================
systemctl enable kismet
systemctl enable probequest
systemctl enable airodump
echo Done.
sleep 3
