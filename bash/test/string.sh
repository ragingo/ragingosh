#!/bin/bash

test_string_sh() {
    test_string_sh_split
    show_cmd_result "$?" "test_string_sh_split"
}

export -f test_string_sh

# shellcheck disable=SC2034
test_string_sh_split() {
    local actual=()
    local str="12 34 56"
    split actual "$str"
    local expected=(12 34 56)
    assert_array_equals expected actual
}

export -f test_string_sh_split
