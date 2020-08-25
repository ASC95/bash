#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/185897/find-files-based-on-modified-datespecifying-the-exact-hour

find_file_by_modified_time_range() {
    # Remember that ~ expansion doesn't happen in quotes!
    cd ~/programming/tutorials
    # Find files that were modified between 12 AM and 3 AM and ignore .git/ files
    find . -newermt "2020-07-04 00:00:00" -not -newermt "2020-07-04 03:00:00" -not -path '*.git*'
}

enumerate_files() {
    printf '%s\n' 'See bash/3-tools/linux-executables/redirection/xargs.sh'
}

grep_odt_files() {
    printf '%s\n' 'See bash/3-tools/scripts/grep-odt-files/grep-odt-files.sh'
}

compare_file_identifies() {
    printf '%s\n' 'See bash/3-tools/linux-executables/file-search/find.sh'
}

#find_file_by_modified_time_range
#enumerate_files
#grep_odt_files
compare_file_identifies
