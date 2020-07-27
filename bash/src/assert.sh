#!/bin/bash

include_guard ASSERT_SH || return 0

assert_equals() {
    local a=$1
    local b=$2
    if [[ "$a" == "$b" ]]; then
        return 0
    fi
    return 1
}

export -f assert_equals

assert_array_equals() {
    local -n __assert_array_equals_a=$1
    local -n __assert_array_equals_b=$2
    local size_a="${#__assert_array_equals_a[@]}"
    local size_b="${#__assert_array_equals_b[@]}"
    assert_equals "$size_a" "$size_b"
    for ((i=0; i<"$size_a"; i++)); do
        assert_equals "${__assert_array_equals_a[$i]}" "${__assert_array_equals_b[$i]}"
    done
}

export -f assert_array_equals
