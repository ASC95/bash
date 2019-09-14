#!/bin/bash

# https://linuxconfig.org/bash-printf-syntax-basics-with-examples

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # change to current directory

# printf and echo are actually fairly complex.

# Always put the format specifier in quotes, even if it seems to work without them.

print_basic_string() {
    #printf This is a string # Output: 'This' - no format specifier was given, so printf only takes 1 argument
    #printf %s This is a string # Output: 'Thisisastring' - a format specifier was given, so printf will take a variable number of arguments, but each argument is appended together
    #printf 'This is a string' 'and here is more' # Output: 'This is a string' - like the first example, no format specifier was given
    #printf %s 'This is a string' 'and here is more' # Output: 'This is a stringand here is more'
    printf '%d' 'This is a string' # Terminal exits with 1 because 'This is a string' is an invalid number
}

# Formatting output with echo is a nightmare. It's easy with printf
format_every_string() {
    printf '%s\n' 'This' 'is' 'a' 'set' 'of' 'nice' 'strings' '!'
}

#print_basic_string
#format_every_string