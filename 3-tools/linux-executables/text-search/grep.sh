#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}")"

# -A <num>: add <num> lines of context after each match
# -B <num>: add <num> lines of context before each match
# -C <num>: add <num> lines of context before and after each match
adjust_output_window() {
    #grep "Oranges" test.txt
    grep -C 1 "Oranges" test.txt
}

grep_odt_files() {
    printf '%s\n' 'See /home/austin/programming/tutorials/bash/3-tools/scripts/grep-odt-files/grep-odt-files.sh'
}

# - grep only has the "--include" option, which only matches the basename of files against the provided glob pattern
#   - Therefore, to only include specific directories I'll have to exclude directories I don't want to search
include_paths() {

}

exclude_paths() {

}

# - Use the -n flag to show the line number of matches
show_line_number() {

}

adjust_output_window
#grep_odt_files