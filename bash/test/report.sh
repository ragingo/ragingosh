#!/bin/bash

show_cmd_result() {
    local ret=$1
    local cmd_name=$2
    local status
    if [[ $ret == 0 ]]; then
        status="OK"
    else
        status="NG"
    fi
    echo "$status $cmd_name"
}

export -f show_cmd_result
