#!/bin/bash

nlist='^[0-9]+$'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

column1_background=$(grep -s column1_background color.conf | sed 1q | cut -d= -f2 | tr -d '[:space:]')
column1_font_color=$(grep -s column1_font_color color.conf | sed 1q | cut -d= -f2 | tr -d '[:space:]')
column2_background=$(grep -s column2_background color.conf | sed 1q | cut -d= -f2 | tr -d '[:space:]')
column2_font_color=$(grep -s column2_font_color color.conf | sed 1q | cut -d= -f2 | tr -d '[:space:]')

res=$(bash $SCRIPT_DIR/check_color.sh $column1_background\
    $column1_font_color\
    $column2_background\
    $column2_font_color)

if [ $res != 1 ]; then 
column1_background='2'
column1_font_color='4'
column2_background='5'
column2_font_color='1'
fi

declare -A color_names
tmp=$(bash $SCRIPT_DIR/pick_color.sh $column1_background $column1_font_color)
color_names[0]=$(echo $tmp | awk '{print $2}')
color_names[1]=$(echo $tmp | awk '{print $3}')
color_palette=$(echo $tmp | awk '{print $1}')
color_palette+=" "

tmp=$(bash $SCRIPT_DIR/pick_color.sh $column2_background $column2_font_color)
color_names[2]=$(echo $tmp | awk '{print $2}')
color_names[3]=$(echo $tmp | awk '{print $3}')
color_palette+=$(echo $tmp | awk '{print $1}')

if [ $res != 1 ]; then 
column1_background="default"
column1_font_color="default"
column2_background="default"
column2_font_color="default"
fi

palette_info="\nColumn 1 background = $column1_background ${color_names[0]}"
palette_info+="\nColumn 1 font color = $column1_font_color ${color_names[1]}"
palette_info+="\nColumn 2 background = $column2_background ${color_names[2]}"
palette_info+="\nColumn 2 font color = $column2_font_color ${color_names[3]}"

echo  $color_palette $palette_info
