#!/bin/bash

info=$(./get_info.sh)
echo -e "$info"
choice=''

echo -e "\nWrite data in file? (y/n)"
read choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    ./write_info.sh "$info"
fi