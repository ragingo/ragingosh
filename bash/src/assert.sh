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
    assert_equals "${#__assert_array_equals_a[@]}" "${#__assert_array_equals_b[@]}"
    # TODO: 配列の中身チェック
}

export -f assert_array_equals
