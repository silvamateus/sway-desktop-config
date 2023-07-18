date_formatted=$(date '+%d/%m/%Y %H:%M:%S')


battery_info=$(upower --show-info $(upower --enumerate |\
grep 'BAT0') |\
egrep "state|percentage" |\
awk '{print $2}')

volume=$(pamixer --get-volume-human |\
        awk '{\
        value="";\ 
        if($1 == "muted") \
          value="🔇 ";\ 
        else if(int($1) <= 50) \
          value="🔈 ";\ 
        else if(int($1) > 50 && int($1) <= 100) \
          value="🔉 ";\ 
        else \
          value="🔊 ";\ 
        \
        print value$1;\ 
}')

echo $battery_info 🔋 $date_formatted $volume
