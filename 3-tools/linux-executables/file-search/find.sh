#!/usr/bin/env bash

# - https://stackoverflow.com/questions/23356779/how-can-i-store-the-find-command-results-as-an-array-in-bash/54561526 - store $ find $ output in an
#   array
# - https://stackoverflow.com/questions/33980224/how-to-check-if-two-paths-are-equal-in-bash - how to compare file identities

# - See bash/3-tools/linux-executables/redirection/mapfile.sh
store_find_output_in_array() {
    cd '/home/austin/programming/tutorials/bash/3-tools/linux-executables/redirection'
    mapfile -d '' array < <(find . -name "*.sh" -print0)
    declare -p array
}

# - params: two paths. returns true if they both refer to the same file
is_same_file() {
    # - test if $ find $ prints anything
    if [[ -s "$(find -L "$1" -samefile "$2")" ]]; then  # as the last command inside the {}, its exit status is the function return value
        echo 'files are identical'
    else
        echo $'files are different (or file doesn\'t exist if there was error)'
    fi
}

#store_find_output_in_array
#is_same_file
