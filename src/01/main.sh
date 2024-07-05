#! /bin/bash

re='^[0-9]+$'

if [ $# != 1 ]; then
echo "There must be one parameter!"; exit 1
elif [[ $1 =~ $re ]]; then
echo "Parameter is a number!"; exit 1
fi

echo "$1"
exit 0