#!/bin/bash

res=$(./check_color.sh $1 $2 $3 $4)

if [ $# != 4 ]; then
echo "There must be 4 colors!"; exit 1
elif [[ $res != 1 ]]; then
echo "Try with different colors!"; exit 1
fi


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info=$(bash $SCRIPT_DIR/get_info.sh $1 $2 $3 $4)
echo -e "$info"

