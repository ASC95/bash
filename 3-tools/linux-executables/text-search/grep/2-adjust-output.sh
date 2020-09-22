#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}")"

# -A <num>: add <num> lines of context after each match
# -B <num>: add <num> lines of context before each match
# -C <num>: add <num> lines of context before and after each match
adjust_output_window() {
    #grep 'Oranges' test.txt
    grep -C 1 'Oranges' test.txt
}

# - Use the -n flag to show the line number of matches
show_line_number() {
    grep -n 'Oranges' test.txt
}

grep_odt_files() {
    printf '%s\n' 'See /home/austin/programming/tutorials/bash/3-tools/scripts/grep-odt-files/grep-odt-files.sh'
}

#adjust_output_window
show_line_number