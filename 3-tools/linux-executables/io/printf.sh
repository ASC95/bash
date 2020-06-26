#!/usr/bin/env bash

# https://linuxconfig.org/bash-printf-syntax-basics-with-examples
# https://stackoverflow.com/questions/2676507/printf-example-in-bash-does-not-create-a-newline

cd "$( dirname "${BASH_SOURCE[0]}")"

use_no_format_specifier() {
    # No format specifier was given, so printf only takes 1 argument
    printf This is a string # This
    # Like the first example, no format specifier was given, so only 1 argument is accepted
    printf 'This is a string' 'and here is more' # This is a string
}

# Using a single format specifier and a single argument is often the easiest way to use printf
# - Always put the format specifier in quotes, even if it seems to work without them
use_single_format_specifier() {
    # A format specifier was given, so printf will take a variable number of arguments, but each argument is appended together
    printf %s This is a string # Thisisastring
    a='This'
    b='is'
    c='a'
    d='set'
    e='of'
    f='nice'
    g='strings'
    # This is generally not what I want. Using a single format specifier with multiple arguments will apply that specifer to each argument
    printf '~%s~\n' $a $b $c $d $e $f $g
    # ~This~
    # ~is~
    # ~a~
    # ~set~
    # ~of~
    # ~nice~
    # ~strings~
    # This is how to concatenate strings into a single argument
    printf '%s\n' "$a $b $c $d $e $f $g"
}

# As long as I use the correct number of format specifiers, I can pass multiple arguments to printf and get the format I expected
use_multiple_format_specifiers() {
    printf '%s~%s~%s\n' 'Hi' 'there' 'person' # Hi~there~person
}

use_the_correct_format_specifiers() {
    # Terminal exits with 1 because 'This is a string' is an invalid number
    printf '%d' 'This is a string' 
}

#use_no_format_specifier
#use_single_format_specifier
#use_multiple_format_specifiers
use_the_correct_format_specifiers
