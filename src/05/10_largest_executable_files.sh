#!/bin/bash

exe_files=$(file -F" " $1* | grep " executable" | awk '{print $1}' )
du -h $exe_files | sort -rh
echo "$exe_files"