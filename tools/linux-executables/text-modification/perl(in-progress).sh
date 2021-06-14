#!/usr/bin/env bash

# - https://stackoverflow.com/questions/366980/what-are-the-differences-between-perl-python-awk-and-sed - perl is better than awk, awk is better than
#   sed
# - https://www.atrixnet.com/in-line-search-and-replace-in-files-with-real-perl-regular-expressions/ - using perl for command-line text replacement

cd "$(dirname "${BASH_SOURCE[0]}")"

# - perl is horribly complex, because it's a complete language like Python (so are sed and awk)! I think I can get away with just copying sed syntax
#   for basic tasks

# - Apparently I cannot use semicolons to provide separate functions with perl like I can with sed
#   - I have to use multiple -e

trim_leading_whitespace_and_quotes_and_trailing_whitespace() {
    #perl -p -e 's/^[^a-zA-Z0-9]*/"/; s/[^a-zA-Z0-9]*$/"/g' 'testfile.txt' | xargs printf '\-> %s \<-\n'
    perl -p -e 's/(^"|^)/"/; s/("$|$)/"/g' 'testfile.txt'
    #perl -p -e 's/^/"/; s/($|"$)/"/g' 'testfile.txt' | xargs printf '-> %s <-\n'
}

trim_leading_whitespace_and_quotes_and_trailing_whitespace