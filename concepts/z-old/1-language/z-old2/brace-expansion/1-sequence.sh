#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Brace-Expansion

# - Brace expansion is INCLUSIVE of <END>

# - Brace expansion is very powerful because it generates all permutations of whatever is inside of the braces combined with the (optional) preamble
#   and postscript components
# - Any special characters preserve their meanings for subsequent steps in the Bash parser
#   - That means an open quote or brace will cause problems

# - Brace expansion does not use quotes
# - Brace expansion itself is not a command
#   - Doing it without a command results in an error
# - Syntax: {<START>..<END>..<INCR>}
#   - Brace expansion is INCLUSIVE of <END>
list_numbers() {
    # {1..10} # Brace expansion is not a command
    # Recall that printf can take multiple arguments just fine. Each argument is treated according to the format specifier string
    printf '%s ' {1..10} # 1 2 3 4 5 6 7 8 9 10
    printf '\n\n'
    printf '%s\n' {1..10..2} # 1 3 5 7 9
    #printf '%s\n' "${1..10}" # Bad substitution error
}

# - There are two sequence types: characters and integers
#   - They cannot be mixed
list_characters() {
    printf '%s ' 'Integers' {1..10} # Integers 1 2 3 4 5 6 7 8 9 10
    printf '\n'
    printf '%s ' 'Characters' {A..z} # Recall that uppercase letters comes before lowercase letters
    printf '\n'
    printf '%s ' 'Characters' {a..Z} # This is actually a backwards sequence!
    printf '\n'
    #printf '%s ' {a..1} # Does not expand into anything
}

# 26 * 10 * 26 = 6760
lots_of_permutations() {
    #printf '%s ' {a..z}{0..9}{A..Z}
    printf '%s\n' {a..z}{0..9}{A..Z} | wc -l
}

list_numbers
list_characters
lots_of_permutations