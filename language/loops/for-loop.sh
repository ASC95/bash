#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php#for
# https://stackoverflow.com/questions/966020/how-to-produce-a-range-with-step-n-in-bash-generate-a-sequence-of-numbers-with - Bash 4 includes the
# range step feature
# https://bash.cyberciti.biz/guide/$IFS - internal field separator notes

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Syntax:
#
# for <var> in <list>
# do
#   <commands>
# done
#
# - <list> is a list of strings that are separated by some delimiter
#   - Words in a string are delimited by whitespace, assuming the default IFS (internal field separator) setting
print_names() {
    names="Austin Alina Karissa David,Bill"
    for n in "${names}"
    do
        printf "${n}"
    done
}

# Here is how to write a for-loop on a single line. The semicolons shown here are the absolute minimum required to do this
print_animals() {
    IFS=$'|'
    animals="cat|dog|frog|elephant|cheetah"
    for a in "${animals}"; do printf '%s\n' "${a}"; done
}



# Bash has special syntax to create lists of numbers. I assume the syntax is just shorthand for creating a regular list that happens to contain only
# numbers. Both limits of a range are inclusive
print_ascending_range() {
    for i in {1..10}
    do
        printf '%d\n' "${i}"
    done
    printf '%s ' {1..10}
}

# Bash 3.2.57 does not have the step feature :(
print_stepped_descending_range() {
    for i in {12..0..4}
    do
        printf '%d ' "${i}"
    done
}

# Wildcard summary:
#
# - * - 0 or more characters
# - ? - exactly one character
# - [a-z] - any character that falls into the range of a-z
# - [r] - any character that is an 'r'
# - [^d] - any character that is not 'd'
iterate_with_wildcard() {
    for object in $(ls [fi]*) # list files or directories in the cwd that start with 'f' or 'i'
    do
        printf '%s\n' "${object}"
    done
}

#print_names
print_animals
#print_ascending_range
#print_stepped_descending_range
#iterate_with_wildcard