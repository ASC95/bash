#!/usr/bin/env bash

# - http://mywiki.wooledge.org/BashGuide/InputAndOutput
# - https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - @ and # parameters
# - https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html - shift command

# - Braces are required to reference beyond the nineth positional parameter
#   - See 1-language/variables/expansion/brace-expansion/positional-parameters.sh
braces_are_required_for_positional_parameters_past_nine() {
    echo $1
    echo $2
    echo $3
    echo $4
    echo $5
    echo $6
    echo $7
    echo $8
    echo $9
    #echo $10
    echo ${10}
}

# - # expands to the number of positional parameters
get_number_of_positional_parameters() {
    printf '%s\n' "$#" # 3
}

# - @ expands to all of the positional parameters with each parameter separated by a space
get_array_of_positional_parameters() {
    # By using double quotes, I can make Bash treat each positional parameter as if it was double-quoted (e.g. "$1" "$2")
    printf ' ~%s~ ' "$@" 
    printf '\n'
    # Without double quotes, each individual parameter undergoes word splitting (i.e. if a positional parameter contains white space, then every word
    # within that parameter will be its own parameter)
    printf ' ~%s~ ' $@ 
}

# - The $ shift $ built-in is generally used when the number of arguments is not known in advance
# - The $ shift $ built-in will shift the positional parameters left by the given argument
#   - If the argument is omitted, it has a default value of 1
#   - If the argument is greater than the number of positional parameters, $ shift $ has no effect
shift_positional_parameters() {
    printf '%s\n' "$#"
    printf '%s\n' "$@"
    if [[ (($#)) ]]; then # See 1-language/arithmetic/1-arithmetic-context.sh and 
        printf 'Usage in extended BNF: { "-" <option flag> " "} <filename>'
        exit
    fi
    #while [[ (($#)) && $1 == -* ]]; do 
    #    printf 'Flag: %s\n' $1
    #    shift
    #done
    #printf 'Filename: %s\n' $1
}

#braces_are_required_for_positional_parameters_past_nine 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten'
#get_number_of_positional_parameters 1 2 3
#get_array_of_positional_parameters 'Hello there!' 'General Kenobi!'
shift_positional_parameters
#shift_positional_parameters -a -b -c blah.txt