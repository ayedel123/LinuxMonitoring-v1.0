#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info=$(bash $SCRIPT_DIR/get_info.sh)
echo -e "$info"

bash $SCRIPT_DIR/write_info.sh "$info"

