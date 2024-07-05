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

c1=$1
c2=$2
ec="\e[0m"

info="${c1}HOSTNAME${ec} = ${c2}$hostname${ec}"
info+="\n${c1}TIMEZONE${ec} = ${c2} $timezone${ec}"
info+="\n${c1}USER${ec} = ${c2} $USER${ec}"
info+="\n${c1}OS${ec} = ${c2} $OSTYPE${ec}"
info+="\n${c1}DATE${ec} = ${c2} $date${ec}"
info+="\n${c1}UPTIME${ec} = ${c2} $uptime${ec}"
info+="\n${c1}UPTIME_SEC${ec} = ${c2} $uptime_sec${ec}"
info+="\n${c1}IP${ec} = ${c2} $ip${ec}"
info+="\n${c1}MASK${ec} = ${c2} $mask${ec}"
info+="\n${c1}GATEWAY${ec} = ${c2} $gateway${ec}"
info+="\n${c1}RAM_TOTAL${ec} = ${c2} $ram_total GB${ec}"
info+="\n${c1}RAM_USED${ec} = ${c2} $ram_used GB${ec}"
info+="\n${c1}RAM_FREE${ec} = ${c2} $ram_free GB${ec}"
info+="\n${c1}SPACE_ROOT${ec} = ${c2} $space_root MB${ec}"
info+="\n${c1}SPACE_ROOT_USED${ec} = ${c2} $space_root_used MB${ec}"
info+="\n${c1}SPACE_ROOT_FREE${ec} = ${c2} $space_root_free MB${ec}"

echo -e $info