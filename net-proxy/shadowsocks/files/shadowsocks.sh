#!/bin/bash
CONFIG_FILE="/etc/shadowsocks.json"

COUNT="0"

help_info(){

    echo "This is wrapper for sslocal"
    echo "--start       start shadowsocks client"
    echo "--stop        stop shadowsocks client"
    echo "-c            spectial a config file"
}

start_shadowsocks(){
    ps -A | grep 'sslocal' > /dev/null
    if [[ $? = 0 ]];then
        echo "shadowsocks is running"
        exit 1
    fi
    sslocal -c ${CONFIG_FILE} > /tmp/shadowsocks.log  2>&1 &
}

if [[ $1 = "" ]];then
    help_info
fi

for arg in $@
do
    if [[ $COUNT = 1 ]];then
        CONFIG_FILE=$arg
        break
    fi

    if [[ $arg = "-c" ]];then
        ((COUNT = COUNT + 1))
    fi
done


for arg in $@
do 
    case $arg in
        "--start") start_shadowsocks;;
        "--stop" ) pkill sslocal;break;;
        *        ) 
            help_info
        ;;
    esac
done

    
