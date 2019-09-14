#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

freestyle() {
    #grep -ri --exclude-dir "venv*" "cleanupfeeders" /Users/austinchang/pycharm/omf
    grep -rn --exclude-dir "venv*" --include "*.py" "truncate" /Users/austinchang/pycharm/omf
}

# Use the -r flag for recursive searching
recursive_search() {
    grep -r "test" .
}

# Must often use the wildcard "*" to specify directories to exclude
exclude_directories() {
    #grep -r --exclude-dir "venv*" "buffer" /Users/austinchang/tutorials/python/advanced
    grep -r --exclude-dir "venv*" "flush" /Users/austinchang/tutorials/python/language
}

include_files() {
    # Look for lines where a file is being opend in 'r+' mode, but only in relevant Python files
    grep -rn --exclude-dir "venv*" --include "*.py" "open\(.*r+.*\)" /Users/austinchang/pycharm/omf
}

multiple_search() {
    # Search for locked_open, open, open with r+, and truncate calls
    grep -rni --exclude-dir "venv*" --include "web.py" -e "open[\s]*\(.*\)" -e "truncate" /Users/austinchang/pycharm/omf
}

#freestyle
#recursive_search
#exclude_directories
#include_files
multiple_search