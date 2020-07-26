#!/bin/bash

include_guard ARRAY_SH || return 0

#######################################
# 渡された配列を指定されたサイズにし、
# 指定された値で埋める
#
# Globals:
#   None
# Arguments:
#   $1: array
#   $2: array size
#   $3: value
# Outputs:
#   $1
#######################################
array_fill() {
    local -n __array_fill_arr=$1
    local size=$2
    local val=$3
    for _ in $(seq 1 "$size"); do
        __array_fill_arr+=("$val")
    done
}

export -f array_fill

#######################################
# 配列の要素数をカウント
#
# Globals:
#   None
# Arguments:
#   $1: array
# Outputs:
#   要素数
#######################################
array_count() {
    local -n __array_count_arr=$1
    echo "${#__array_count_arr[@]}"
}

export -f array_count

#######################################
# 配列の各要素にコールバック関数を適用する
#
# Globals:
#   None
# Arguments:
#   $1: array
#   $2: callback
# Outputs:
#   $1
#######################################
array_map() {
    local -n __array_map_arr=$1
    local fn=$2
    for ((i = 0; i < "${#__array_map_arr[@]}"; i++)); do
        __array_map_arr[$i]=$($fn "${__array_map_arr[$i]}")
    done
}

export -f array_map

array_filter() {
    local -n __array_filter_arr=$1
    local fn=$2
    local count="${#__array_filter_arr[@]}"

    for ((i = 0; i < "$count"; i++)); do
        if ! $fn "${__array_filter_arr[$i]}"; then
            unset "__array_filter_arr[$i]"
        fi
    done
}

export -f array_filter
