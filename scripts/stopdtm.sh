#!/bin/bash
#
echo Stopping DTM services
echo ==========================
systemctl stop kismet
systemctl stop probequest
systemctl stop airodump
echo Starting Network Manager
echo ==========================
systemctl start NetworkManager
echo Done.
