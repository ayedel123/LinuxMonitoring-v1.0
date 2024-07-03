#!/bin/bash

conf_files=$(find $1 -maxdepth 1 -type f -name "*.conf" | wc -l)
text_files=$(file -i $1* | grep " text/plain;" | wc -l)
exe_files=$(file -b $1* | grep "executable" | wc -l)
log_files=$(find $1 -maxdepth 1 -type f -name "*.log" | wc -l)
archive_files=$(file -b $1* | grep "archive" | wc -l)
symbolic_links=$(find $1 -maxdepth 1 -type l | wc -l) 


echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $text_files"
echo "Executable files = $exe_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symbolic_links"