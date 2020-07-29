#!/bin/bash

test_run() {
    local fn=$1
    $fn
    show_cmd_result "$?" "$fn"
}

export -f test_run

test_all_run() {
    local prefix=$1
    local fn_list
    fn_list=$(declare -x -F | cut -d' ' -f3 | grep -E "^$prefix.+$")

    for fn in $fn_list; do
        test_run "$fn"
    done
}

export -f test_all_run
