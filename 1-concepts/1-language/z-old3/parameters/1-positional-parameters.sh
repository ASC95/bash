#!/usr/bin/env bash
set -uo pipefail

# - https://mywiki.wooledge.org/BashGuide/InputAndOutput
# - https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - @, *, and # parameters
# - https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html - shift command

# - Braces are required to reference beyond the nineth positional parameter
#    - There is no $0 positional parameter. $0 is a special Bash variable
braces_are_required_for_positional_parameters_past_nine() {
    echo $1 # one
    echo $2 # two
    echo $3 # three
    echo $4 # four
    echo $5 # five
    echo $6 # six
    echo $7 # seven
    echo $8 # eight
    echo $9 # nine
    echo $10 # one0
    echo ${10} # ten
}

# - The positional parameters can be counted without storing them in an array
count_positional_parameters() {
    printf '%s\n' "$#" # 3
}

# - "$@" and "$*" behave exactly the same way as they do for arrays
#   - See bash/1-concepts/1-language/variable-types-arrays/5-expand-array.sh
expand_positional_parameters() {
    printf '~%s~' "$@" # ~foo~~bar~~baz~
    echo ''
    (IFS='^'; printf '%s\n' "$*") # foo^bar^baz
}

# - By itself, "$@" expands into the positional parameters, where each positional parameter is its own word
#   - It's useful to store "$@" within an array in order to individually reference the positional parameters
store_positional_parameters_in_array() {
    printf '~%s~' "$@" # ~foo~~bar~~baz~~hi there~
    ary=("$@")
    # - This is a mistake in THIS context. It is not a mistake to do this in general
    #ary="$@"
    printf '~%s~' "$ary" # ~foo~
    echo ''
    printf '~%s~' "${ary[@]}" # ~foo~~bar~~baz~~hi there~
    echo ''
    printf '~%s~' "${ary[0]}" # ~foo~
    echo ''
    printf '~%s~' "${ary[1]}" # ~bar~
    echo ''
    printf '~%s~' "${ary[2]}" # ~baz~
}

# - The $ shift $ built-in is generally used when the number of arguments is not known in advance
# - The $ shift $ built-in will shift the positional parameters left by the given argument
#   - If the argument is omitted, it has a default value of 1
#   - If the argument is greater than the number of positional parameters, $ shift $ has no effect
shift_positional_parameters() {
    #printf 'Number of arguments: %s\n' "$#"
    #printf 'All arguments: %s\n' "$@"
    # - There is a great deal happening in this line:
    #   - $# == 0 is evaluated first
    #       - If no arguments are provided, $# is 0, so the evaluation of the == expression returns 1 (success). We now have ((1))
    #       - If at least one argument is provided, $# is 1, so the evaluation of the == expression returns 0 (failure). We now have ((0))
    #   - ((<expression>)) is evaluated next:
    #       - ((1)) exits with 0 (success)
    #       - ((0)) exits with 1 (failure)
    #   - Thus, given the behavior of the if-statement:
    #       - $# == 0 branches to then
    #       - $# == 1 branches to else
    if (($# == 0)); then
        echo 'No parameters were provided'
        printf '%s\n' 'Usage in extended BNF: { "-" <option flag> " "} <filename>'
        exit 1
    fi
    while (($# > 1)); do 
        if [[ $1 == -* ]]; then
            printf 'Option: %s\n' $1
            shift
        else
            printf 'Bad option: %s\nExiting...\n' $1
            exit 1
        fi
    done
    printf 'Filename: %s\n' $1
}

#braces_are_required_for_positional_parameters_past_nine 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten'
#count_positional_parameters 'foo' 'bar' 'baz'
expand_positional_parameters 'foo' 'bar' 'baz'

#store_positional_parameters_in_array 'foo' 'bar' 'baz' 'hi there'
#shift_positional_parameters
#shift_positional_parameters -a -b c blah.txt
#shift_positional_parameters -a -b -c blah.txt
#shift_positional_parameters blah.txt