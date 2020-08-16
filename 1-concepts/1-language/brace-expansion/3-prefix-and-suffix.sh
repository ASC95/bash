#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Brace-Expansion
# - https://wiki.bash-hackers.org/syntax/expansion/brace

# - Comma-separated lists can have prefixes and suffixes
list_c_words() {
    # "c" is the prefix and "t" is the suffix
    printf '%s ' c{a,e,i,o,u}t # cat cet cit cot cut
    printf '\n'
    # Brace expansion does not allow spaces within the braces
    printf '%s ' c{a, e, i, o, u}t # Does not expand into anything
}

# - Sequences can also have prefixes and suffixes
prefix_and_suffix_sequence() {
    echo f{1..5}d # f1d f2d f3d f4d f5d
}

#list_c_words
prefix_and_suffix_sequence
