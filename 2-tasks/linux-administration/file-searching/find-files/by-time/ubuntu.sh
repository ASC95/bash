#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/185897/find-files-based-on-modified-datespecifying-the-exact-hour

find_file_by_modified_time_range() {
    # Remember that ~ expansion doesn't happen in quotes!
    cd ~/programming/tutorials
    # Find files that were modified between 12 AM and 3 AM and ignore .git/ files
    find . -newermt "2020-07-04 00:00:00" -not -newermt "2020-07-04 03:00:00" -not -path '*.git*'
}

find_file_by_modified_time_range
