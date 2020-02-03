#!/bin/bash
#
echo Stopping Network Mananger
echo ==========================
systemctl stop NetworkManager
echo Starting DTM services
echo ==========================
systemctl start kismet
systemctl start probequest
systemctl start airodump
echo Done.
wait 3
