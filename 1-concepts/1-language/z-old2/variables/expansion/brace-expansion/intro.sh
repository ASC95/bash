#!/usr/bin/env bash

THESE NOTES NEED TO BE REORGANIZED.  I WAS READING THROUGH THE WOOLEDGE INPUT/OUTPUT NOTES AND JUST EXPLORING EVERY TANGENT
 
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Parameter-Expansion
# - https://mywiki.wooledge.org/BashFAQ/073 - possibly helpful parameter expansion examples

# - https://stackoverflow.com/questions/8748831/when-do-we-need-curly-braces-around-shell-variables - Brace usage with variable names, arrays,
#   positional arguments, filename expansion
# - https://stackoverflow.com/questions/14049057/bash-expand-variable-in-a-variable - indirect expansion of variables
# - https://unix.stackexchange.com/questions/68042/double-and-triple-substitution-in-bash-and-zsh - double indirection? It's hard

# - https://stackoverflow.com/questions/10067266/when-to-wrap-quotes-around-a-shell-variable - when to quote variables

# - TLDR; braces are not required to expand a variable unless:
#   1) The variable is adjacent to a substring within a string
#   2) I'm referencing an array element
#   3) I'm referencing beyond the ninth positional parameter

cd "$(dirname "${BASH_SOURCE[0]}")"

# - One situation when braces could be useful is when expanding a variable within a string
braces_separate_variable_names() {
    type='Processing'
    printf '%s\n' "A $typeError was raised during execution" # "typeError" is not a variable name, so the variable expands to "" (null string)
    printf '%s' "A " "$type" "Error was raised during execution" # Braces aren't required but this looks weird
    printf '\n'
    printf '%s\n' "A ${type}Error was raised during execution" # This is clean
}

# - Braces are unconditionally required to reference array elements
braces_expand_array_elements() {
    ary=(first third fifth seventh ninth)
    printf '%s\n' $ary[2] # first[2]
    printf '%s\n' ${ary[2]} # fifth
}

# - Braces are required to reference positional arguments greater than 9.
braces_expand_double_digit_positional_arguments() {
    printf '%s\n' "Positional argument 9 was $9" # 9a
    printf '%s\n' "Positional argument 10 was ${10}" # 10a
    #printf '%s\n' "Positional argument 10 was $10" # 1a0
}

# - Braces appear to be required to perform indirect variable expansion. Indirect variable expansion uses the expansion of one variable to form the
#   name of another variable that will also be expanded
# - Double indirection is hard. Bash doesn't allow nested substitutions
braces_allow_indirect_expansion() {
    for i in {1..10}; do
        #printf '%s\n' "Positional argument $i was ${${i}}" # Bad substitution
        printf '%s\n' "Positional argument $i was ${!i}"
    done
    Boots="quackers"
    kitty_cat="Boots"
    # Double indirection is hard
    printf '%s\n' "The cat's name is ${!kitty_cat}" # quackers
}

# Braces are NOT required to perform globbing. However, they are required to use globbing to strip characters from globbed results.
# - Remember that Bash does not allow nested substitutions
# - Globbing isn't applied to strings that are quoted
braces_strip_globbed_values() {
    filenames=4-* # This is valid globbing. The variable 'filenames' IS equal to the list of filenames!
    # Here, $filenames is expanded to '4-*', then later on globbing is used on the literal string '4-*'
    #printf '%s ' $filenames
    # This does not work because $filenames is expanded to '4-*' early on, but 4-* is in a quoted state, so it globbing won't be applied to it
    #printf '\n%s' "Filenames: $filenames"
    # This line is the same as the above line
    #printf '\n%s' "Filenames: 4-*"
    for f in $filenames
    do
        printf '%s\n' ${f%.*} # strip the extension from each filename in the list
    done
}

# Without quotes, $my_var is 5 separate arguments to printf. With quotes, "$my_var" is a 1 single argument to printf
# - Braces do not preserve a string with spaces as a single value. Only quotes do
# - In short, quote everything that that I don't want token splitting and wildcard expansion to apply to. That's it
# - Word-splitting actually is governed by the special $IFS shell variable, which by default is <space><tab><newline>. This can be changed
double_quotes_preserve_strings_with_spaces() {
    my_var="This is a nice sentence."
    #printf '%s\n' $my_var
    #printf '%s\n' ${my_var}
    printf '%s\n' "$my_var"
}

#braces_separate_variable_names
#braces_expand_array_elements
#braces_expand_double_digit_positional_arguments '1a' '2a' '3a' '4a' '5a' '6a' '7a' '8a' '9a' '10a' '11a'
braces_allow_indirect_expansion '1a' '2a' '3a' '4a' '5a' '6a' '7a' '8a' '9a' '10a' '11a'
#braces_strip_globbed_values
#double_quotes_preserve_strings_with_spaces


# more stuff....

# https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
# https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02 - dealing with unset and null chart
# https://serverfault.com/questions/7503/how-to-determine-if-a-bash-variable-is-empty - checking for unset AND empty string