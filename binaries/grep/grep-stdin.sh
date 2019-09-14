#/usr/bin/env bash

# grep isn't just for working with files! grep reads input files. Thus, it reads from stdin and its stdin is made to point to some file. Therefore, I
# can pipe the output of any command into grep. I can also use process substitution <(..)
# - grep delimits by newlines. That's why I want to quote "${str}", so that token splitting is NOT applied so that NO new newlines are introduced by
#   the output of printf
function print_matching_lines() {
    # Use ANSI-C quoting to make life easy
    str=$'This is a WARNING 1\nThis is OK\nThis is a WARNING 2\n'
    # Token splitting is NOT applied. printf is just printing the newlines that it finds in the single argument
    printf '%s' "${str}" 
    # Token splitting IS applied. Each whitespace or newline will divide the string into tokens. printf is just printing the tokens that were
    # supplied to it, so each token is printed verbatim according to the format string
    #printf '%s' ${str} 
    grep "OK" <(printf '%s' "${str}")
    printf '%s' "${str}" | grep "OK" 
}

# TODO
function filter_output() {
    ary=('This is a WARNING 1' 'This is OK' 'This is a WARNING 2')
    for e in ${ary[*]}; do
        printf '%s\n' $e
    done
    #printf '%s' "${str}" | grep "OK" 
}

#print_matching_lines
filter_output