case $1 in  # bc color
    '1')
    background_color='\e[107m' # white
    ;;
    '2')
    background_color='\e[101m' # red
    ;;
    '3')
    background_color='\e[102m' # green
    ;;
    '4')
    background_color='\e[104m' # blue
    ;;
    '5')
    background_color='\e[105m' # purple
    ;;
    '6')
    background_color='\e[40m' # black
    ;;
esac

case $2 in  # text color
    '1')
    font_color='\e[97m' # white
    ;;
    '2')
    font_color='\e[91m' # red
    ;;
    '3')
    font_color='\e[92m' # green
    ;;
    '4')
    font_color='\e[94m' # blue
    ;;
    '5')
    font_color='\e[95m' # purple
    ;;
    '6')
    font_color='\e[30m' # black
    ;;
esac

echo "$font_color$background_color"