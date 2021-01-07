#! /bin/bash

echo "[1] Install requirements"
echo "[2] Exit"

read -p"Enter an option: " option
if [[ $option == 1 ]]; then
echo "Installing..."
sudo apt-get install cowsay -y
sudo apt-get install aircrack-ng -y
apt-get install figlet -y
elif [[ $option == 2 ]]; then
exit
fi
