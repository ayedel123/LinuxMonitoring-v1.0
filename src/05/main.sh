#!/bin/bash

function count_time(){
  start_time=$1
  total_time=$(date +%s)
  echo "Script execution time (in seconds) = $(($total_time - $start_time))"
}

time_start=$(date +%s)

path=$1
path_end=${path:${#A}-1:1}

if ! [ -d $path ] || ! [ $path_end = '/' ]; then
count_time $time_start
exit 1;
fi

./number_of_folders.sh $path
./5_largest_folders.sh $path
./number_of_files.sh $path
./number_of_special_files.sh $path
./10_largest_files.sh $path
./10_largest_executable_files.sh $path

count_time $time_start




