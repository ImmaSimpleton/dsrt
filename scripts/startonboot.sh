#!/bin/bash
#
#This will start the DTM services on boot
systemctl disable NetworkManager.service
systemctl enable kismet
systemctl enable probequest
systemctl enable airodump

zenity --info --text "The DSRT will start Digital Terrain Mapping on startup now."

