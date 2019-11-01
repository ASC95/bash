#!/bin/bash

# https://stackoverflow.com/questions/13460482/exclude-a-sub-directory-using-find

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

exclude_filename