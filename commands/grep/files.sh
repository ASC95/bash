#/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Use the '-w' flag to match the pattern only to separate words
# Use the '-A', '-B', and '-C' flags to print lines surrounding the match
freestyle() {
    #grep -ri --exclude-dir "venv*" "cleanupfeeders" /Users/austinchang/pycharm/omf
    # This search verifies that plain 'open()' calls are no longer being used in web.py
    #grep --exclude-dir "venv*" --include "web.py" -rnw "open" /Users/austinchang/pycharm/omf 
    # This search verifies that r+ mode is being used correctly in web.py
    #grep --exclude-dir "venv*" --include "web.py" -rnw "r+" -C 7 /Users/austinchang/pycharm/omf 
    # Verify decorators
    #grep -C 4 -n "@app.route" /Users/austinchang/pycharm/omf/omf/web.py
    grep --exclude-dir 'venv*' -rli '\.omc' /Users/austinchang/pycharm/omf

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
    #grep -rni --exclude-dir "venv*" --include "web.py" -e "open[\s]*\(.*\)" -e "truncate" /Users/austinchang/pycharm/omf
    grep -rni --exclude-dir "venv*" --include "__neoMetaModel__.py" -e "open[\s]*\(.*\)" -e "truncate" /Users/austinchang/pycharm/omf/omf/models
}

#freestyle
#recursive_search
#exclude_directories
#include_files
multiple_search