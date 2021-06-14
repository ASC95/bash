#!/usr/bin/env bash

# - https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script

cd "$(dirname "${BASH_SOURCE[0]}" )"

check_if_command_in_path_and_executable() {
    if ! [ -x "$(command -v $1)" ]; then
        printf '%s %s %s\n' "Error: \"$1\" is not in" '$PATH' ", is not executable, or is not installed." >&2
        exit 1
    fi
}

check_if_command_in_path_and_executable git # $ git $ exists, so no output
check_if_command_in_path_and_executable slim # $ slim $ does not exist, so outputs to stdout
