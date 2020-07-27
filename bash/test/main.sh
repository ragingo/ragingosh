#!/bin/bash

set -u

readonly BASH_SRC_FILE="${BASH_SOURCE:-$0}"
readonly BASH_SRC_DIR="${BASH_SRC_FILE%/*}"

# shellcheck disable=SC2164
pushd "$BASH_SRC_DIR"
# shellcheck disable=SC1091
source ../src/include.sh
include ../src/assert.sh
include ../src/string.sh
include ./report.sh
include ./string.sh
# shellcheck disable=SC2164
popd

main() {
    bash -c 'set -u; test_string_sh'
}

main
