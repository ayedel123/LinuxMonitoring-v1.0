#!/bin/bash

largest_folders=$(du -h --max-depth=1 $path*/ | \
    sort -hr | \
    head -n 5 | \
    awk '{print NR " - " $2", " $1}')

echo -e "TOP 5 folders of maximum size \
    arranged in descending order (path and size): \
    \n${largest_folders}"

echo "etc up to 5"