#!/bin/bash

include_guard MATH_SH || return 0

is_odd() {
    if [[ $(("$1" & 1)) -eq 1 ]]; then
        true
    else
        false
    fi
}

export -f is_odd

is_even() {
    if [[ $(("$1" & 1)) -eq 0 ]]; then
        true
    else
        false
    fi
}

export -f is_even

# ビットシフトを書くと、VSCode拡張のエラーでエディタが真っ赤になってしまう・・・
# ということで自分で用意した
# が、 ** 演算子があったから要らなくなった
pow() {
    local b=$1
    local e=$2
    local r=1
    for ((i=0; i<e; i++)) do
        r=$((r * b))
    done
    echo "$r"
}

export -f pow

sum() {
    local -n __sum_arr=$1
    local pred=${2:-""}
    local ret=0

    for ((i=0; i<"${#__sum_arr[@]}"; i++)) do
        local v="${__sum_arr[$i]}"
        if [[ $pred = "" ]]; then
            ret=$((ret + v))
        else
            if $pred "$v"; then
                ret=$((ret + v))
            fi
        fi
    done

    echo "$ret"
}

export -f sum

fact() {
    local x=$1
    if [[ $x -le 1 ]]; then
        echo 1
    else
        local y
        y=$(fact $(("$x" - 1)))
        echo $(("$x" * y))
    fi
}

export -f fact
