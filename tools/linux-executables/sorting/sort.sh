#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/52762/trying-to-sort-on-two-fields-second-then-first

cd "$(dirname "${BASH_SOURCE[0]}")"

# If no keys are provided, the entire line (delineated by a newline) is used as the key to sort
sort_by_entire_line() {
    sort test.txt
}

# Here, I define the field separator to be the character ":". Now the line is composed of two fields. I then specify that the sort should use fields
# [2,2], so that it will only use the numeric part of the line to sort. I also must specify the numeric sort option "-n" to sort numerically instead
# of lexicographically.
sort_by_numeric_key() {
    sort -t ":" -k 2,2 -n test.txt
}

# Use the -u option to suppress all keys that are identical to a key that has already been found
# - Order matters
sort_unique() {
    # Only outputs zigbag:1 one time
    sort -t ':' -k 2 -nu test.txt 
    # Outputs zigbag:1 twice
    #sort -t ':' -k 2 -n test.txt 
}

sort_git_reflog() {
    # - Sorts using the entire line
    #sort -u 'test2.txt'
    # - Sorts using the initial commit hash
    sort -t ' ' -k 1,1 -u 'test2.txt'
}

#sort_by_entire_line
#sort_by_numeric_key
#sort_unique
sort_git_reflog