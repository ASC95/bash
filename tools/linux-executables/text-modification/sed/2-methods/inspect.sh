#!/usr/bin/env bash

# - 

cd "$(dirname "${BASH_SOURCE[0]}")"

# - By default, sed always prints the results of the command(s) to stdout unless the -n flag is used
print_lines() {
    # - This does not work because no command was given to sed
    #sed '../testfile.txt'

    # - The command given was 'p', which means print
    sed -n 'p' '../testfile.txt'
}

print_lines