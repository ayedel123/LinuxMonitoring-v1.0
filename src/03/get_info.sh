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

nc=$(./pick_color.sh $1 $2)
vc=$(./pick_color.sh $3 $4)
ec="\e[0m"

info="${nc}HOSTNAME${ec} = ${vc}$hostname${ec}"
info+="\n${nc}TIMEZONE${ec} = ${vc} $timezone${ec}"
info+="\n${nc}USER${ec} = ${vc} $USER${ec}"
info+="\n${nc}OS${ec} = ${vc} $OSTYPE${ec}"
info+="\n${nc}DATE${ec} = ${vc} $date${ec}"
info+="\n${nc}UPTIME${ec} = ${vc} $uptime${ec}"
info+="\n${nc}UPTIME_SEC${ec} = ${vc} $uptime_sec${ec}"
info+="\n${nc}IP${ec} = ${vc} $ip${ec}"
info+="\n${nc}MASK${ec} = ${vc} $mask${ec}"
info+="\n${nc}GATEWAY${ec} = ${vc} $gateway${ec}"
info+="\n${nc}RAM_TOTAL${ec} = ${vc} $ram_total GB${ec}"
info+="\n${nc}RAM_USED${ec} = ${vc} $ram_used GB${ec}"
info+="\n${nc}RAM_FREE${ec} = ${vc} $ram_free GB${ec}"
info+="\n${nc}SPACE_ROOT${ec} = ${vc} $space_root MB${ec}"
info+="\n${nc}SPACE_ROOT_USED${ec} = ${vc} $space_root_used MB${ec}"
info+="\n${nc}SPACE_ROOT_FREE${ec} = ${vc} $space_root_free MB${ec}"

echo -e $info