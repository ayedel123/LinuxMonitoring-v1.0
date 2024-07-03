#!/bin/bash

color=$(./read_color.sh)

info=$(./get_info.sh $color)

echo -e "$info"

echo -e $(echo $color | awk '{for (i=3; i<=NF; i++) print $i}')

