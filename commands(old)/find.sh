#!/usr/bin/env bash

# https://stackoverflow.com/questions/13460482/exclude-a-sub-directory-using-find
# https://stackoverflow.com/questions/6787913/bash-find-directories
# https://stackoverflow.com/questions/6041596/how-to-output-file-names-surrounded-with-quotes-in-single-line - filenames with spaces

# Options
# - $ find <directory> -inum <inode number>
#   - Find all hard links with the same inode number! Neat!
#       - E.g. $ find . -inum 657024
# - $ find <directory> - samefile <file name>
#   - Find all hard links that point to the same inode, but use the name of the hard link instead of the inode number
#       - E.g. find . -samefile file.txt


# -type f: find files only
# -not -path '<path>': if anything has <path> as a component its entire path, don't include it
exclude_filename() {
    find ~ -iname '*unicode*.py' -type f -not -path '*/Library*' -not -path '*venv*'
}

# - The -type flag allows me to find files of a specific type
find_directories() {
    find '/Users/austinchang/tutorials/bash/commands' -type d
}

# - I should always do this to anticipate filenames with spaces
# - Remember that the -name option is REQUIRED to restrict the set of found files
#   - Without -name (or -iname), all files will be found
# - The fact that {} is replaced with a filename that output by find is unique to find. Also, this substitution only occurs for the -exec family of
#   find options. This substitution is not the standard behavior of printf or any other utility that I'm aware of
output_filename_in_quotes() {
    find '/Users/austinchang/pycharm/omf' -iname "*.glm" -type f -exec printf '"{}"\n' \;
    ## Does not work
    #find '/Users/austinchang/pycharm/omf' -iname "*.glm" -type f -exec printf '%s\n' \;
}

#exclude_filename
#find_directories
output_filename_in_quotes