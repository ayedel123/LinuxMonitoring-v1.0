#!/bin/bash

dir_count=$(find $1 -mindepth 1 -type d 2>/dev/null| wc -l)

echo "Total number of folders (including all nested ones) = ${dir_count}"
