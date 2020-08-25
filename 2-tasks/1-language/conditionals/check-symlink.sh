#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Bash-Conditional-Expressions
# - https://stackoverflow.com/questions/19860345/how-to-check-if-a-symlink-target-matches-a-specific-path

cd "$(dirname "${BASH_SOURCE[0]}")"

# - The -h new test flag checks if a file is a symbolic link
#   - It does not check if the link points to something valid
check_if_symlink_exists() {
    #if [[ -h 'check-symlink-symlink' ]]; then
    if [[ -h 'check-symlink.sh' ]]; then
        echo 'The symlink exists'
    else
        echo $'The symlink doesn\'t exist'
    fi
}

# - readlink will only output a path if it actually reads a symlink
#   - It does NOT verify that the symlink points to an existing hard link!
check_symlink_target() {
    path="$(readlink 'check-symlink-symlink')"
    #path=$(readlink 'check-symlink.sh')
    printf '%s\n' "Target is: $path" # This path doesn't exist!
}

#check_symlink_target
check_symlink_target
