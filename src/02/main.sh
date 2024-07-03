#!/bin/bash

info=$(./get_info.sh)
echo -e "$info"

./write_info.sh "$info"
