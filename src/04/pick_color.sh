#!/bin/bash

case $1 in 
    '1')
    background_color='\e[107m' # white
    background_color_name="(white)"
    ;;
    '2')
    background_color='\e[101m' # red
    background_color_name="(red)"
    ;;
    '3')
    background_color='\e[102m' # green
    background_color_name="(green)"
    ;;
    '4')
    background_color='\e[104m' # blue
    background_color_name="(blue)"
    ;;
    '5')
    background_color='\e[105m' # purple
    background_color_name="(purple)"
    ;;
    '6')
    background_color='\e[40m' # black
    background_color_name="(black)"
    ;;
esac

case $2 in  # text color
    "1")
    font_color='\e[97m' # white
    font_color_name="(white)"
    ;;
    '2')
    font_color='\e[91m' # red
    font_color_name="(red)"
    ;;
    '3')
    font_color='\e[92m' # green
    font_color_name="(green)"
    ;;
    '4')
    font_color='\e[94m' # blue
    font_color_name="(blue)"
    ;;
    '5')
    font_color='\e[95m' # purple
    font_color_name="(purple)"
    ;;
    '6')
    font_color='\e[30m' # black
    font_color_name="(black)"
    ;;
esac

echo "$font_color$background_color $background_color_name $font_color_name"