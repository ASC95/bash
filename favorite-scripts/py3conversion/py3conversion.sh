#!/usr/bin/env bash

# https://stackoverflow.com/questions/10346816/using-grep-to-search-for-a-string-that-has-a-dot-in-it
# https://superuser.com/questions/794963/in-a-linux-shell-why-does-backslash-newline-not-introduce-whitespace - \ is the escape character
# in the SHELL (not grep), except when it is single-quoted. Therefore, use double quotes with grep expressions

# This script is aliased as py3 in .bash_profile

# Just see print() changes
#python-modernize -f 'libmodernize.fixes.fix_print' $1

# Apply print() fixes directly to file
python-modernize -wnf 'libmodernize.fixes.fix_print' $1 >/dev/null 2>&1

# Show all identified changes, except for print
# - I should just find-fix iteritems() everywhere manually
python-modernize -x 'libmodernize.fixes.fix_print' $1

printf '\n%s\n' '~~~~~~~~~~~~~~~~~~~~ GREP ~~~~~~~~~~~~~~~~~~~~'

# Search for stuff. Division is fine.
# - Variables can be divided by other variables!
# - Don't need to search for locked_open(). If anything was using it before, it will still work. If anything was using an encoding, it was using
#   io.open() which will still work. I don't want to add locked_open() in any models since hopefully I'll refactor them

grep -n \
    -e '/' \
    -e "\<open[[:space:]]*(" \
    -e "\<file[[:space:]]*(" \
    -e "\<sorted[[:space:]]*(" \
    -e "\<has_key[[:space:]]*(" \
    -e "\<range[[:space:]]*(" \
    -e "\<print[[:space:]]*((" \
    -e "\.sort[[:space:]]*(" \
    -e "\<fileinput\." \
    -e "\<for.*\.keys[[:space:]]*(" \
    -e "\<import.*csv" \
    -e "\<from.*csv" \
    -e "\<urllib" \
    -e "\<urlparse" \
    $1
printf '\n%s\n' '~~~~~~~~~~~~~~~~~~~~ Remember to check import statements and delete the print import! ~~~~~~~~~~~~~~~~~~~~'

# -e "\<locked_open[[:space:]]*(" \