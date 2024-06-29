#!/bin/bash

if [ $# != 4 ]; then
echo "There must be 4 colors!"; exit 1
elif [[ $1 = $2 || $3 = $4 ]]; then
echo "Try with different colors!"; exit 1
elif [[ $1 < 0 || $1 > 6 \
|| $2 < 0 || $2 > 6 \
||$3 < 0 || $3 > 6|| \
$4 < 0 || $4 > 6 ]]; then
echo "Wrong colors!"; exit 1
fi

info=$(./get_info.sh $1 $2 $3 $4)
echo -e "$info"

