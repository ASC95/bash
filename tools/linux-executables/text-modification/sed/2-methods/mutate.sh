#!/usr/bin/env bash

# - 

cd "$(dirname "${BASH_SOURCE[0]}")"

# - The 'd' command deletes lines
# - The -i option does the operation in place
#   - The -i.<suffix> option renames the original file with the given <suffix>, then acts like it does the operation in-place
# - sed almost always counts from 1, not 0, when dealing with line numbers
#   - I say almost because there is a regular expression address specifier that uses 0
# - If a file is really huge, it's a pain to open it in an editing program to make a few changes
delete_lines_from_file(){
    sed -i.bak '1d' '../testfile.txt'
}

delete_lines_from_file