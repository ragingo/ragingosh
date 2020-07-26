#!/bin/bash

include_guard IO_SH || return 0

get_dirname() {
    local path=$1
    echo "${path%/*}"
}

export -f get_dirname

get_basename() {
    local path=$1
    echo "${path##*/}"
}

export -f get_basename

get_abs_file_path_from_inum() {
    local dir=$1
    local inum=$2
    find "$dir" -type f -inum "$inum"
}

export -f get_abs_file_path_from_inum

get_inum() {
    local file=$1
    find "$file" -printf '%i\n'
}

export -f get_inum
