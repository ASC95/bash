#!/usr/bin/env bash

# - http://mywiki.wooledge.org/BashGuide/InputAndOutput
# - https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - @, *, and # parameters
# - https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html - shift command

# - See 1-language/redirection/1-command-line-arguments.sh

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

# - If $@ is double-quoted, then it expands to separate elements and each element does NOT have word splitting applied to it
# - If $@ is not quoted, word splitting is performed on every element in addition to every element being separate
#   - In other words, unquoted $* and $@ are identical
get_element_centric_array_of_positional_parameters() {
    # - By using double quotes, I can make Bash treat each positional parameter as if it was double-quoted (e.g. "$1" "$2")
    printf ' ~%s~ ' "$@" #  ~foo~  ~bar~  ~baz~  ~hi there~ 
    printf '\n'
    # - Without double quotes, each individual parameter undergoes word splitting (i.e. if a positional parameter contains white space, then every
    #   word within that parameter will be its own parameter)
    printf ' ~%s~ ' $@  # ~foo~  ~bar~  ~baz~  ~hi~  ~there~ 
}

# - It appears to be perfectly fine to do "$@"
#   - See 1-concepts/1-language/array/2-reference-elements.sh
inspect_element_centric_array_of_positional_parameters() {
    ary="$@"
    printf '~%s~' "$ary" # ~foo bar baz hi there~
    echo ''
    printf '~%s~' "${ary[@]}" # ~foo bar baz hi there~
    echo ''
    printf '~%s~' "${ary[0]}" # ~foo bar baz hi there~
    echo ''
    printf '~%s~' "${ary[1]}" # <nothing>
    echo ''
    printf '~%s~' "${ary[2]}" # <nothing>
}

# - If $* is double-quoted, then it expands to one long string within which no word splitting occurs
# - If $* is not quoted, word splitting is performed on the entire string and every element
#   - In other words, unquoted $* and $@ are identical
get_string_centric_array_of_positional_parameters() {
    printf ' ~%s~ ' "$*" # ~foo bar baz hi there~
    printf '\n'
    printf ' ~%s~ ' $*  # ~foo~  ~bar~  ~baz~  ~hi~  ~there~ 
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
#get_number_of_positional_parameters 1 2 3
#get_element_centric_array_of_positional_parameters 'foo' 'bar' 'baz' 'hi there'
inspect_element_centric_array_of_positional_parameters 'foo' 'bar' 'baz' 'hi there'
#get_string_centric_array_of_positional_parameters 'foo' 'bar' 'baz' 'hi there'

#shift_positional_parameters
#shift_positional_parameters -a -b c blah.txt
#shift_positional_parameters -a -b -c blah.txt
#shift_positional_parameters blah.txt
