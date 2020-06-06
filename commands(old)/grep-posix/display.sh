#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}")"

# -A <num>: add <num> lines of context after each match
# -B <num>: add <num> lines of context before each match
# -C <num>: add <num> lines of context before and after each match
adjust_output_window() {
    #grep "Oranges" test.txt
    grep -C 1 "Oranges" test.txt
}

adjust_output_window