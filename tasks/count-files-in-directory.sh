#!/usr/bin/env bash

# - https://stackoverflow.com/questions/11307257/is-there-a-bash-command-which-counts-files

cd "$(dirname "${BASH_SOURCE[0]}")"

# - There are a lot of tricky considerations for this deceptively complex task

# - This approach has bugs, but it's easy to remember
count_files_easily() {
    ls -1q | wc -l
}

count_files_easily