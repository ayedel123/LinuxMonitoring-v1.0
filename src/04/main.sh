#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $# != 0 ]]; then 
	echo "There must be no parameters!"; exit 1
fi 

color=$(bash $SCRIPT_DIR/read_color.sh)

info=$(bash $SCRIPT_DIR/get_info.sh $color)

echo -e "$info"

echo -e $(echo $color | awk '{for (i=3; i<=NF; i++) print $i}')

