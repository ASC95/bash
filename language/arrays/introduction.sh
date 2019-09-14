#!/usr/bin/env bash

# https://mywiki.wooledge.org/BashGuide/Arrays
# https://stackoverflow.com/questions/52590446/bash-array-using-vs-difference-between-the-two - @ vs. *

# A string is supposed to hold 1 element and I should treat it as such. An array maps integers to strings. 

# If the array ITSELF is double quoted, then:
# - "${ary[*]}" expands to a single word, with each array element separated by the first character of the IFS. This is kind of like treating the array
#   as a string
# - "${ary[@]}" expands each element inside into a separate word
#
# If the array isn't doubled quoted at all, then I risk splitting up the elements themselves that are inside of the array (bad). In short, always use
# the "${ary[@]}" syntax
at_vs_star() {
    ary=("Hello there" 'hi and goodbye' 'hey there')
    # Hello there hi and goodbye hey there!
    printf '%s!\n' "${ary[*]}" 
    echo
    # Hello there!
    # hi and goodbye!
    # hey there!
    printf '%s!\n' "${ary[@]}"
    echo
    #Hello!
    #there!
    #hi!
    #and!
    #goodbye!
    #hey!
    #there!
    printf '%s!\n' ${ary[*]}
    echo
    # Same as above...
    printf '%s!\n' ${ary[@]}
}

# Use the =(..) syntax to create an array with elements 
create_array_simple() {
    ary=(1 2 3 4 5)
    for e in "${ary[@]}"; do
        printf '%s\n' $e
    done
}

#at_vs_star
create_array_simple