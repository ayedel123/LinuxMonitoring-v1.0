#!/bin/bash


if [[ $# != 0 ]]; then 
	echo "There must be no parameters!"; exit 1
fi 

color=$(./read_color.sh)

info=$(./get_info.sh $color)

echo -e "$info"

echo -e $(echo $color | awk '{for (i=3; i<=NF; i++) print $i}')

