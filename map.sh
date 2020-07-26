#!/bin/bash

include_guard MAP_SH || return 0

map_keys() {
    local -n __map_keys_map=$1
    for k in "${!__map_keys_map[@]}"; do
        echo "$k"
    done
}

export -f map_keys

map_values() {
    local -n __map_values_map=$1
    for v in "${__map_values_map[@]}"; do
        echo "$v"
    done
}

export -f map_values

map_entries() {
    local -n __map_entries_map=$1
    for k in "${!__map_entries_map[@]}"; do
        echo "$k ${__map_entries_map[$k]}"
    done
}

export -f map_entries

map_entry_count() {
    local -n __map_entry_count_map=$1
    echo "${#__map_entry_count_map[@]}"
}

export -f map_entry_count

map_contains_key() {
    local -n __map_contains_key_map=$1
    local k=$2
    local ret=${__map_contains_key_map[$k]:+1}
    echo "${ret:-0}"
}

export -f map_contains_key
