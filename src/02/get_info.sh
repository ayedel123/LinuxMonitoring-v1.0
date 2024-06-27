#!/bin/bash

hostname=$(hostname)
timezone=$(timedatectl | awk '/Time zone:/ {print $3 $4 $5}' | tr '(),' ' ')
date=$(date | awk '{print $3, $2, $6, $4}')
uptime=$(uptime -p | awk '{print $2,$3,$4,$5}')
uptime_sec=$(cat /proc/uptime | awk '{print $1}')
ip=$(hostname -I | awk '{print $1}')
mask=$(ifconfig | awk '/netmask/ {print $4}'| sed 1q )
gateway=$(ip r | awk 'NR==1 {print $3}')
ram_total=$(free -m | awk '/Mem:/ { printf("%.3f", $2/1024) }')
ram_used=$(free -m | awk '/Mem:/ { printf("%.3f", $3/1024) }')
ram_free=$(free -m | awk '/Mem:/ { printf("%.3f", $4/1024) }')

space_root=$(df / |awk 'NR==2{ printf("%.2f", $2/1024) }')
space_root_used=$(df / |awk 'NR==2{ printf("%.2f", $3/1024) }')
space_root_free=$(df / |awk 'NR==2{ printf("%.2f", $4/1024) }')

info="HOSTNAME = $hostname"
info+="\nTIMEZONE = $timezone"
info+="\nUSER = $USER"
info+="\nOS = $OSTYPE"
info+="\nDATE = $date"
info+="\nUPTIME = $uptime"
info+="\nUPTIME_SEC = $uptime_sec"
info+="\nIP = $ip"
info+="\nMASK = $mask"
info+="\nGATEWAY = $gateway"
info+="\nRAM_TOTAL = $ram_total GB"
info+="\nRAM_USED = $ram_used GB"
info+="\nRAM_FREE = $ram_free GB"
info+="\nSPACE_ROOT = $space_root MB"
info+="\nSPACE_ROOT_USED = $space_root_used MB"
info+="\nSPACE_ROOT_FREE = $space_root_free MB"

echo $info