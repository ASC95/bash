#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - The --include=<glob> option allows me to include files in a recursive search
#   - Therefore, to only include specific directories I'll have to exclude directories I don't want to search
include_files_with_glob_pattern() {
    cd '/home/austin/programming/tutorials/bash/3-tools/linux-executables/text-search/grep'
    # - The --include option ensures that only THIS file is searched and that 1-regular-expression-syntax-varations.sh and 2-adjust-output.sh are ignored
    grep --include 3-* 'the' -r .
}

# - The --exclude-dir=<glob> option allows me to exclude directories from a recursive search
exclude_directories_with_glob_pattern() {
    cd '/home/austin/programming/tutorials/bash/3-tools/linux-executables/text-search'
    # - Nothing is searched
    #grep --exclude-dir 'grep' 'the' -r .
    # - The grep/ directory is searched
    grep --exclude-dir 'gre' 'the' -r .
}

exclude_files_with_glob_pattern() {
    cd '/home/austin/programming/tutorials/bash/3-tools/linux-executables/text-search/grep'
    # - Only search this file
    #grep --exclude '1-*' --exclude '2-*' 'the' -r .
    # - Search 2-adjust-output.sh and this file
    grep --exclude '1-*' 'the' -r .
}

#include_files_with_glob_pattern
#exclude_directories_with_glob_pattern
exclude_files_with_glob_pattern
