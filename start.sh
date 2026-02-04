#!/bin/bash

# Starting up the infrastructure

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
BOLD="\e[1m"
RESET="\e[0m"

choose_from_menu() {
    local -r prompt="$1" outvar="$2" options=("${@:3}")
    local cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\\e") # cache ESC as test doesn't allow esc codes
    printf "$prompt\\n"
    while true
    do
        # list all options (option list is zero-based)
        index=0 
        for o in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then echo -e " >\\e[7m$o\\e[0m" # mark & highlight the current option
            else echo "  $o"
            fi
            (( ++index ))
        done
        read -s -n3 key # wait for user to key in arrows or ENTER
        if [[ $key == $esc[A ]] # up arrow
        then (( cur-- )); (( cur < 0 )) && (( cur = 0 ))
        elif [[ $key == $esc[B ]] # down arrow
        then (( ++cur )); (( cur >= count )) && (( cur = count - 1 ))
        elif [[ $key == "" ]] # nothing, i.e the read delimiter - ENTER
        then break
        fi
        echo -en "\\e[${count}A" # go up to the beginning to re-render
    done
    # export the selection to the requested output variable
    printf -v $outvar "${options[$cur]}"
}

monitoring_command_execution() {
    "$@"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔ Command succeeded${RESET}"
    else
        echo -e "${RED}✖ Command failed${RESET}"
        return 1
fi
}

clear;
cat << "EOF"
______                                                  _       _   _                        _ _      
| ___ \                                                | |     | | (_)                      | | |     
| |_/ /___  ___ ___  ___  _   _ _ __ ___ ___   _ __ ___| | __ _| |_ _  ___  _ __  _ __   ___| | | ___ 
|    // _ \/ __/ __|/ _ \| | | | '__/ __/ _ \ | '__/ _ \ |/ _` | __| |/ _ \| '_ \| '_ \ / _ \ | |/ _ \
| |\ \  __/\__ \__ \ (_) | |_| | | | (_|  __/ | | |  __/ | (_| | |_| | (_) | | | | | | |  __/ | |  __/
\_| \_\___||___/___/\___/ \__,_|_|  \___\___| |_|  \___|_|\__,_|\__|_|\___/|_| |_|_| |_|\___|_|_|\___|
                                                                                                      
EOF



selections=(
"1. Development environment"
"2. Production environment"
"3. Exit"
)

choose_from_menu "Choose your environment to start :" selected_choice "${selections[@]}"
echo "Selected choice: $selected_choice"


case $selected_choice in

  "1. Development environment")
    monitoring_command_execution docker compose --env-file .env.dev up -d;
    ;;

  "2. Production environment")
    monitoring_command_execution docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d;
    ;;

  "3. Production environment")
    echo "Exiting infrastructure startup.";
    ;;
esac