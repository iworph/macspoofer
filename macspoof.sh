#!/bin/bash
macspoofdir=$(dirname "$0")
flag_file="$macspoofdir/.macspooffirstflag" # Path to the flag file

if [ ! -f "$flag_file" ]; then
  # makes alias when first ran
  echo "Executing for the first time, making alias: macspoof."
  echo "alias macspoof="$macspoofdir/macspoof.sh"" >> ~/.bashrc
  # Creates flag file
  touch "$flag_file"
  echo "alias created."
else
echo "alias already created, skipping"
fi
# Rest of the script (always executed unless i fucked something up)
echo "Continuing with the rest of the script."
##all the echo and sleep after this is bs just to make it feel fancy, can be removed later if too innefecient or if security issues arise.
echo "begin spoof process"
sleep .1
var1=$(shuf -i 0-9 -n 1)
var2=$(shuf -i 0-4 -n 1)
var3=$(($var2 * 2))
mac2=$(shuf $macspoofdir/macoptions -n 1)
mac3=$(shuf $macspoofdir/macoptions -n 1)
mac4=$(shuf $macspoofdir/macoptions -n 1)
mac5=$(shuf $macspoofdir/macoptions -n 1)
mac6=$(shuf $macspoofdir/macoptions -n 1)
echo "$var1$var3"
sleep .6
echo "$mac2"
sleep .1
echo "$mac3"
sleep .3
echo "$mac4"
sleep .2
echo "$mac5"
sleep .5
echo "$mac6"
sudo ifconfig wlan0 down
sudo ifconfig wlan0 hw ether $var1$var3:$mac2:$mac3:$mac4:$mac5:$mac6
sudo ifconfig wlan0 up
echo "new mac is $var1$var3:$mac2:$mac3:$mac4:$mac5:$mac6"
