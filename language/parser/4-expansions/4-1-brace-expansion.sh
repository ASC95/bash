#!/usr/bin/env bash

# https://itnext.io/upgrading-bash-on-macos-7138bd1066ba
# https://tiswww.case.edu/php/chet/bash/bashref.html#Brace-Expansion
# https://wiki.bash-hackers.org/syntax/expansion/brace - <PREAMBLE>{<start>..<end>}<POSTSCRIPT>

# Remember that I need to use the updated version of Bash installed via Homebrew
# Brace expansion is very powerful. It generates all permutations of whatever is inside of the brace, combined with the (optional) preamble and
# postscript components. Any special characters preserve their meanings for subsequent steps in the Bash parser.
# - That means an open quote or brace will cause problems

# Brace expansion does not use quotes. Brace expansion itself is not a command. Doing it without a command results in an error
# - {<START>..<END>..<INCR>} (Bash 4)
function list_numbers() {
    # {1..10} # Brace expansion is not a command
    printf '%s ' {1..10} # 1 2 3 4 5 6 7 8 9 10
    printf '%s\n'
    printf '%s\n' {1..10..2} # 1 3 5 7 9
    #printf '%s\n' "{1..10}" # Prints {1..10}
    #printf '%s\n' "${1..10}" # Bad substitution error
}

# There are two sequence types: characters and integers. They cannot be mixed
function sequences() {
    printf '%s ' 'Integers' {1..10} # Integers 1 2 3 4 5 6 7 8 9 10
    printf '%s\n'
    printf '%s ' 'Characters' {A..z} # Recall that uppercase letters comes before lowercase letters
    printf '%s\n'
    printf '%s ' 'Characters' {a..Z} # This is actually a backwards sequence!
    printf '%s\n'
    #printf '%s ' {a..1} # No good
}

# Brace expansion does not allow spaces within the braces
function c_words() {
    printf '%s ' c{a,e,i,o,u}t # cat cet cit cot cut
    printf '%s\n'
    printf '%s ' c{a, e, i, o, u}t # c{a, e, i, o, u}t
}

# 26 * 10 * 26 = 6760
function lots_of_permutations() {
    printf '%s ' {a..z}{0..9}{A..Z}
}



list_numbers
#c_words
#sequences
#lots_of_permutations