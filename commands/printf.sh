#!/usr/bin/env bash

# https://linuxconfig.org/bash-printf-syntax-basics-with-examples
# https://stackoverflow.com/questions/2676507/printf-example-in-bash-does-not-create-a-newline

cd "$( dirname "${BASH_SOURCE[0]}")"

# printf and echo are actually fairly complex.
# Always put the format specifier in quotes, even if it seems to work without them.

print_basic_string() {
    # No format specifier was given, so printf only takes 1 argument
    #printf This is a string # This
    # A format specifier was given, so printf will take a variable number of arguments, but each argument is appended together
    #printf %s This is a string # Thisisastring
    # Like the first example, no format specifier was given
    #printf 'This is a string' 'and here is more' # This is a string
    #printf %s 'This is a string' 'and here is more' # This is a stringand here is more
    # Terminal exits with 1 because 'This is a string' is an invalid number
    printf '%d' 'This is a string' 
}

# Formatting output with echo is a nightmare. It's easy with printf
format_every_input() {
    printf '%s\n' 'This' 'is' 'a' 'set' 'of' 'nice' 'strings' '!'
}

#print_basic_string
format_every_input