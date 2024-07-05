#!/bin/bash
choice=''
echo -e "\nWrite data in file? (y/n)"
read choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    status=$(date +"%d_%m_%y_%H_%M_%S").status 
    touch "$status"
    echo -e "$1" > ./"$status"
fi
