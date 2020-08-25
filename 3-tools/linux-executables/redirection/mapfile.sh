#!/usr/bin/env bash

# - mapfile stores stdin in array
# - By default, stdin elements are delineated with newlines
# - readarray is identical to mapfile
# - This example works by typing in elements and terminating with ctrl + d
store_stdin_in_array() {
    mapfile my_array "$1"
    declare -p my_array
}

store_stdin_in_array