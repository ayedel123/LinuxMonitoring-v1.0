#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

largest_files=$(find $1 -maxdepth 1 -type f -exec du {} + | sort -rh | head -n 10)

largest_files=$(echo "$largest_files" | 
    awk -f "$SCRIPT_DIR/get_file_info")

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$largest_files"

echo "etc up to 10"
