#!/bin/bash

status=$(date +"%d_%m_%y_%H_%M_%S").status 
touch "$status"
echo -e "$1" > ./"$status"