#!/bin/bash
#
#Running this will delete everything on the SD card.
#
#echo 'REALLY DELETE EVERYTHING? (yes/no)'
zenity --question --text "ARE YOU SURE YOU WANT TO ZEROIZE THIS DEVICE?";
if [[ $? == 0 ]]; then
    rm -rf /*
elif [[ $? == 1 ]]; then
    echo "That was a close one!"
fi
: << 'Commenting out'
read $answer
if [[ $answer == yes ]]; then
	rm -rf /*
elif [[ $answer == y ]]; then
	rm -rf /*
elif [[ $answer == Yes ]]; then
	rm -rf /*
elif [[ $answer == YES ]]; then
	rm -rf /*
elif [[ $answer == no ]]; then
	echo That was a close one.
	sleep 1
elif [[ $answer == n ]]; then
	echo That was a close one.
	sleep 1
elif [[ $answer == No ]]; then
	echo That was a close one.
	sleep 1
elif [[ $answer == NO ]]; then
	echo That was a close one.
	sleep 1	
else
	echo 'Type Either "yes" or "no"'
	echo ==========================
	zeroize.sh
fi
Commenting out
reboot
