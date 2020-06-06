#!/usr/bin/env bash

# https://mywiki.wooledge.org/BashGuide/Arrays
# http://mywiki.wooledge.org/ParsingLs - don't parse the output of ls

# The shasum command can be used to see if any file out of a group of files has been corrupted. Simply compare the shasum of the expected file content
# with the shasum of the actual file content. If they don't match for a file, that file is corrupted.

# Parser notes:
# - There are 3 types in Bash: arrays, strings, and integers.
#   -  Whenever I need to operate on a bunch of strings, put them into an array
# - Variables default to global scope, even in Bash functions
# - ${array[*]} will print all the elements of an array. ${array} will print the first element of the array

# 1) Generate the "good" checksum (don't need to store it in a file)
# 2) Read all of the filenames of the files that I want to check against the good checksum
# 3) Create "fake" (temporary) checksum files that have the good checksum along with each filename that was read
# 4) Run $ shasum -a 256 -c <checksum file> for every "fake" checksum file
discover_corrupt_files() {
    cd '/Users/austinchang/tutorials/python/language/python2/multiprocessing_py/concurrent_writes/files'
    valid_shasum1=($(shasum 'template_string.txt')) # =(...) creates an array from the contents
    valid_shasum2=($(shasum 'template_number.txt'))
    echo ${valid_shasum1[0]}
    echo ${valid_shasum2[0]}
    # shasum stdout prints the filename and status. shasum stderr prints WARNING message
    for f in *; do # Never parse the output of ls
        result1=$( shasum -c 2>/dev/null <( printf '%s' "${valid_shasum1[0]}  $f" ) | grep -i 'failed' )
        #printf '%s\n' "$result1"
        result2=$( printf '%s' "${valid_shasum2[0]}  $f" | shasum -c 2>/dev/null | grep -i 'failed' )
        #printf '%s\n' "$result2"
        if [[ -n "$result1" && -n "$result2" ]]; then
            printf '%s\n' "$f is corrupt"
        fi
    done
}

discover_corrupt_files