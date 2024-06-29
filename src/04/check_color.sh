#!/bin/bash

res=1
min_color=0
color_count=7
nlist='^[0-9]+$'

for arg in "$1" "$2" "$3" "$4"; do
    if ! [[ $arg =~ $nlist ]] || [ -z "$arg" ]; then
        res=0
    elif [[ $arg -lt $min_color || $arg -ge $color_count ]]; then
        res=0
    fi
done

if [[ $1 == $2 || $3 == $4 ]]; then
    res=0
fi

echo "$res"