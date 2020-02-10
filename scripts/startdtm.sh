#!/bin/bash
#
echo Stopping Network Mananger
echo ==========================
systemctl stop NetworkManager
echo Starting DTM services
echo ==========================
#mvfiles.sh
systemctl start kismet
systemctl start probequest
systemctl start airodump
echo Done.
sleep 3
