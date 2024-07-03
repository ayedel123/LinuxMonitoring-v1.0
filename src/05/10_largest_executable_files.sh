#!/bin/bash

exe_files=$(file -F" " $1* | grep " executable" | awk '{print $1}')

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) "

if [ -z "$exe_files" ]; then
exit 1
fi

md5="$(md5 -q $exe_files)"
size=$(du -h $exe_files | sort -rh | awk '{print NR" - "$2", "$1", "}')


echo "$size" > tmp_size
echo "$md5" > tmp_md5
echo "$(paste -d'\0' tmp_size tmp_md5)"

rm tmp_size
rm tmp_md5

echo "etc up to 10"