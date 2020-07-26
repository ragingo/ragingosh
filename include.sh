#!/bin/bash

include() {
    # shellcheck disable=SC1090
    source "$1"
}

export -f include

include_guard() {
    local symbol=$1
    if [[ -v __INCLUDE_"${symbol}" ]]; then
        return 1
    else
        readonly __INCLUDE_"${symbol}"=1
        export __INCLUDE_"${symbol}"
        return 0
    fi
}

export -f include_guard

included_files() {
    echo "${!__INCLUDE_*}"
}

export -f included_files
