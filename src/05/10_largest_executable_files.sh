#!/bin/bash

exe_files=$(file -F" " $1* | grep " executable" | awk '{print $1}')
md5="$(md5 -q $exe_files)"
size=$(du -h $exe_files | sort -rh | awk '{print NR" - "$2", "$1", "}')


echo "$size" > tmp_size
echo "$md5" > tmp_md5

echo "$(paste -d'\0' tmp_size tmp_md5)"

rm tmp_size
rm tmp_md5