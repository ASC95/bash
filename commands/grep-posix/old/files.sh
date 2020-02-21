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

# -o will print only the matching part of a line
# - I can't get rid of whitespace before object names because POSIX ERE doesn't support lookarounds. My only option is to pipe through sed
only_matching_string() {
    egrep -o '^.*{' '/Users/austinchang/pycharm/omf/omf/static/testFiles/IEEE-13.glm' | sed -E 's/^[[:space:]]+//' | uni
    egrep -o '^.*{' '/Users/austinchang/pycharm/omf/omf/data/Model/admin/Automated Testing of gridlabMulti/Simple Market System/main.2019-11-01-16-01-35.glm' | sed -E 's/^[[:space:]]+//'
}

# - Just use the -L flag
files_without_keyword() {
    # View filenames
    #grep -rLi 'latitude' '/Users/austinchang/pycharm/omf/omf/static/publicFeeders' | sed -E 's/\/.*\///' | sort
    # View file sizes
    grep -rLi 'latitude' '/Users/austinchang/pycharm/omf/omf/static/publicFeeders' | sed -E 's/^/"/; s/$/"/;' | xargs ls -l
}

# Use the -v flag to invert ALL of the specified patterns
inverted_search() {
    grep -v "delicious" 'test.txt'
}

#recursive_search
#exclude_directories
#include_files
#multiple_search
#only_matching_string
#files_without_keyword
inverted_search