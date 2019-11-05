#!/usr/bin/env bash

# https://mywiki.wooledge.org/BashGuide/Arrays - great info on parsing filenames into an array with null byte
# https://stackoverflow.com/questions/52590446/bash-array-using-vs-difference-between-the-two - @ vs. *
# https://stackoverflow.com/questions/16860877/remove-an-element-from-a-bash-array

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
    printf '%s!\n' "${ary[*]}" # Hello there hi and goodbye hey there!
    echo
    printf '%s!\n' "${ary[@]}" # Hello there!\nhi and goodbye!\nhey there!
    echo
    printf '%s!\n' ${ary[*]} # Hello!\nthere!\nhi!\nand!\ngoodbye!\nhey!\nthere!
    echo
    printf '%s!\n' ${ary[@]} # Same as above
}

# Use the =(..) syntax to create an array with elements 
create_array_simple() {
    ary=(1 2 3 4 5)
    for e in "${ary[@]}"; do
        printf '%s\n' $e
    done
}

# Arrays can be created with indexes, and those indexes can be non-sequential. An array with "holes" in it is called a sparse array
# - When iterating over a sparse array, Bash will ignore unused indexes
create_spare_array() {
    ary=([0]='Austin' [1]='Alina' [10]='Joe')
    for e in "${ary[@]}"; do
        printf '%s\n' $e
    done
}

# Arrays can have elements appended to them
add_to_array() {
    ary=()
    ary+=('Nice element')
    ary+=('Another nice addition')
    for e in "${ary[@]}"; do
        printf '%s\n' "$e"
    done
    echo "${ary[1]}" # Another nice addition
    echo "${ary[@]}" # Nice element Another nice addition
}

# Deleting elements is tricky!

at_vs_star
#create_array_simple
#create_spare_array
#add_to_array