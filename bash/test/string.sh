#!/bin/bash

# shellcheck disable=SC2128
# shellcheck disable=SC2178

test_string_sh() {
    test_all_run test_string_sh
}

export -f test_string_sh

# shellcheck disable=SC2034
test_string_sh_split() {
    local expected=(12 34 56)
    local actual=()
    local str="12 34 56"
    split actual "$str"
    assert_array_equals expected actual
}

export -f test_string_sh_split

test_string_sh_dec_to_hex() {
    local expected="fe"
    local actual
    actual=$(dec_to_hex 254)
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_dec_to_hex

test_string_sh_dec_to_bin() {
    local expected="\xfd"
    local actual
    actual=$(dec_to_bin 253)
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_dec_to_bin

test_string_sh_hex_to_dec() {
    local expected="65534"
    local actual
    actual=$(hex_to_dec "fffe")
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_hex_to_dec

test_string_sh_i_to_c() {
    local expected="A"
    local actual
    actual=$(i_to_c 65)
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_i_to_c

test_string_sh_c_to_i() {
    local expected="66"
    local actual
    actual=$(c_to_i B)
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_c_to_i

test_string_sh_substr() {
    local expected="def"
    local actual
    actual=$(substr abcdefghijklmn 3 3)
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_substr

test_string_sh_trim_spaces() {
    local expected="aa bb"
    local actual
    actual=$(echo "  aa bb  " | trim_spaces)
    assert_equals "$expected" "$actual"
}

export -f test_string_sh_trim_spaces
