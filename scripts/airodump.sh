#!/bin/bash
airmon-ng start wlan0
sleep 15
airodump-ng wlan0mon --output-format csv -w /root/Desktop/DSRT/Airodump/airodump
