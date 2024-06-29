#!/bin/bash

path=$1
dir_count=$(find $path -mindepth 1 -type d 2>/dev/null| wc -l)

files_count=$(find $path -mindepth 1 -type f 2>/dev/null| wc -l)

file_types=( -name "*.conf"
             -o -name "*.txt"
             -o -name "*.log"
             -o -name "*.sh" )

archive_files=( -name "*.tar"
                -o -name "*.rar"
                -o -name "*.zip"
                -o -name "*.7z"
                -o -name "*.gz" )

find $path -type f \( "${file_types[@]}" \) > tmp

conf_files=$(grep -c *.conf tmp)
txt_files=$(grep -c *.txt tmp)
sh_files=$(grep -c *.sh tmp)
log_files=$(grep -c *.log tmp)
archive_files=$(find $path -type f \( "${archive_files[@]}" \) | wc -l )
symbolic_links=$(find $path -type l | wc -l) 

rm tmp

largest_folders=$(du -h --max-depth=1 $path*/ | sort -hr | head -n 5 | awk '{print NR " - " $2", " $1}')
echo "Total number of folders (including all nested ones) = ${dir_count}"

echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n${largest_folders}"

echo "Total number of files = $files_count"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $txt_files"
echo "Executable files = $sh_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symbolic_links"

