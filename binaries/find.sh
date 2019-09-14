#!/bin/bash

# Options
# - $ find <directory> -inum <inode number>
#   - Find all hard links with the same inode number! Neat!
#       - E.g. $ find . -inum 657024
# - $ find <directory> - samefile <file name>
#   - Find all hard links that point to the same inode, but use the name of the hard link instead of the inode number
#       - E.g. find . -samefile file.txt