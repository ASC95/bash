#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/17949/what-is-the-difference-between-grep-egrep-and-fgrep

# egrep uses extended regular expressions instead of patterns like normal grep
# - $ grep -E $ is identical to egrep

# In grep, +, ?, |, (, ) are treated as literal characters instead of metacharacters. The opposite it true for egrep
# - grep can still interpret these characters as metacharacters, they just need to be escaped (e.g. \?)
metacharacter_interpretation() {
    #printf '%s\n' 'I like dogs and cats' | grep -o '(dogs)|(cats)' # no output
    printf '%s\n' 'I like dogs and cats' | egrep -o 'dogs|cats' # dogs\ncats
    printf '%s\n' 'I like dogs and cats' | egrep -o '(dogs)|(cats)' # dogs\ncats
    printf '%s\n' 'I like dogs and cats' | egrep -o '(?:dogs)|(?:cats)' # dogs\ncats
}

metacharacter_interpretation