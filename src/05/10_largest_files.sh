#!/bin/bash

largest_files=$(find $1 -maxdepth 1 -type f -exec du {} + | sort -rh | head -n 10)

largest_files=$(echo "$largest_files" | 
    awk -f "get_file_extension")

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$largest_files"

echo "etc up to 10"
