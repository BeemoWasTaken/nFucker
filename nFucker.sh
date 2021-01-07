#! /bin/bash
#Kuris Code
start(){
cowsay -f ghostbusters nFucker
echo ""
echo "---------------------------------------"                                                                  
echo "[1] Snort basic information"
echo "[2] Snort usefull information"
echo "[3] Execute a wifi network(Deauth)"
echo "[4] Change your MAC address"
echo "[5] Ifconfig"
echo "[6] Enable monitor mode"
echo "[7] Enable managed mode"
echo "---------------------------------------"  
read -p"Enter option: " option

#Option 1
if [[ $option == 1 ]]; then
ifconfig $nCard down
iwconfig $nCard mode monitor
ifconfig $nCard up
airodump-ng $nCard
ifconfig $nCard down
iwconfig $nCard mode managedmonitor
ifconfig $nCard up
clear 
start
#Option 2
elif [[ $option == 2 ]]; then
ifconfig $nCard down
iwconfig $nCard mode monitor
ifconfig $nCard up
read -p"Enter bssid: " bssid
read -p"Enter channel: " channel
airodump-ng --channel $channel --bssid $bssid $nCard

ifconfig $nCard down
iwconfig $nCard mode managed
ifconfig $nCard up

clear
start

#Option 3
elif [[ $option == 3 ]]; then
read -p"Enter the amount of packets you want to send: " pkts
read -p"Enter the wifi bssid: " bssidT
read -p"Enter the network channel: " channel
ifconfig $nCard down
iwconfig $nCard channel $channel
ifconfig $nCard up
xterm -title nFucker-Deauth -hold -e aireplay-ng --deauth $pkts -a $bssidT $nCard
clear
start
#Option 4
elif [[ $option == 4 ]]; then
read -p"Enter new MAC address: " mac
ifconfig $nCard down
ifconfig $nCard hw ether $mac
ifconfig $nCard up
clear
start
#Option 5
elif [[ $option == 5 ]]; then
xterm -title nFucker-IFCONFIG -hold -e ifconfig
clear
start
elif [[ $option == 6 ]]; then
ifconfig $nCard down && iwconfig $nCard mode monitor && ifconfig $nCard up
clear
start
elif [[ $option == 7 ]]; then
ifconfig $nCard down && iwconfig $nCard mode managed && ifconfig $nCard up
clear start
fi

}


nCard=$1
if [[ $nCard == "" || $nCard == " " ]]; then
clear
echo "Enter a valid networkCard!"
else
clear
start
fi
