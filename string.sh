#!/bin/bash

include_guard STRING_SH || return 0

# shellcheck disable=SC2034
split() {
    local -n __split_arr=$1
    local str=$2
    __split_arr=(${str// / })
}

export -f split

dec_to_hex() {
    local v=$1
    printf "%x" "$v"
}

export -f dec_to_hex

dec_to_bin() {
    local v=$1
    local hex
    hex=$(printf "%x" "$v")
    echo "\x$hex"
}

export -f dec_to_bin

hex_to_dec() {
    local v=$1
    echo "$((0x$v))"
}

export -f hex_to_dec

i_to_c() {
    local i=$1
    echo "$i" | awk '{ printf("%c", $1) }'
}

export -f i_to_c

c_to_i() {
  printf "%d" \'"$1"
}

export -f c_to_i

substr() {
    local str=$1
    local start=$2
    local len=$3
    local end=0
    if [ "$len" = "" ]; then
        end=""
    else
        end=$((start + len))
    fi
    start=$((start + 1))
    echo "$str" | cut -d' ' -f "$start-$end"
}

export -f substr

trim_spaces() {
    local stdin=""
    read -r stdin
    echo "$stdin"
}

export -f trim_spaces

bin_to_dec_str() {
    local file=$1

    < "$file" od -t u1 --endian=big -An | \
        tr '\n' ' ' | \
        tr -s ' '
}

export -f bin_to_dec_str

u8xn_to_u32() {
    local n=$1
    shift
    local arr=("$@")
    local sum=0
    for ((i=0; i < n; i++)) do
        local e=$((i * 8))
        local v=${arr[$i]}
        sum=$(( sum + v * (2 ** e) ))
    done
    echo "$sum"
}

export -f u8xn_to_u32

u8x2_to_u32() {
    u8xn_to_u32 2 "$@"
}

export -f u8x2_to_u32

u8x4_to_u32() {
    u8xn_to_u32 4 "$@"
}

export -f u8x4_to_u32

u8xn_string_to_u32() {
    local n=$1
    local str=$2
    local x=()
    split x "$str"
    local y
    y=$(u8xn_to_u32 "$n" "${x[@]}")
    echo "$y"
}

export -f u8xn_string_to_u32

u8x2_string_to_u32() {
    local str=$1
    local x
    x=$(u8xn_string_to_u32 2 "$str")
    echo "$x"
}

export -f u8x2_string_to_u32

u8x4_string_to_u32() {
    local str=$1
    local x
    x=$(u8xn_string_to_u32 4 "$str")
    echo "$x"
}

export -f u8x4_string_to_u32

u32_to_u8x2_string() {
    local v=$1
    local a=$(("$v" >>  0 & 0xff))
    local b=$(("$v" >>  8 & 0xff))
    echo "$a $b"
}

export -f u32_to_u8x2_string

# shellcheck disable=SC2034
u32_to_u8x2() {
    local v=$1
    local -n __u32_to_u8x2_arr=$2
    split __u32_to_u8x2_arr "$(u32_to_u8x2_string "$v")"
}

export -f u32_to_u8x2

u32_to_u8x4_string() {
    local v=$1
    local a=$(("$v" >>  0 & 0xff))
    local b=$(("$v" >>  8 & 0xff))
    local c=$(("$v" >> 16 & 0xff))
    local d=$(("$v" >> 24 & 0xff))
    echo "$a $b $c $d"
}

export -f u32_to_u8x4_string

# shellcheck disable=SC2034
u32_to_u8x4() {
    local v=$1
    local -n __u32_to_u8x4_arr=$2
    split __u32_to_u8x4_arr "$(u32_to_u8x4_string "$v")"
}

export -f u32_to_u8x4
