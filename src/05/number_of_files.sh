#!/bin/bash

files_count=$(find $1 -maxdepth 1 -type f 2>/dev/null| wc -l)

echo Total number of files = $files_count