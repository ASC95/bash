#!/usr/bin/env bash

# - "$@" is not the problem. It's perfectly fine to do that
#   - See /1-concepts/1-language/parameters/positional-parameters.sh
how_to_confuse_myself() {
    # - This horribleness occurs when I create a global variable that shadows another global variable
    #   - The "ary" variable below is a string containing "one two three", but there is ANOTHER global variable called "ary" that is an array
    #       - Bash appears to examine the contents of both variables simultaneously and mash them together
    #           - I could understand if ${ary[0]} referenced the string while ${ary[1]} referenced the array (that is what's happening), but the
    #             declare statement by itself is just plain confusing!
    #  - Bonus way of confusing myself: ary is actually a string!
    ary="$@"
    declare -p ary # declare -a ary=([0]="one two three" [1]="two" [2]="three")
    printf '~%s~' "$ary" # ~one two three~
    echo ''
    printf '~%s~' "${ary[0]}" # ~one two three~
    echo ''
    printf '~%s~' "${ary[1]}" # ~two~
    echo ''
    printf '~%s~' "${ary[2]}" # ~three~
    echo ''
    printf '~%s~' "${ary[3]}" # ~~
    echo ''
    printf '~%s~' "${ary[e]}" # ~one two three~

    # - This problem goes away if I use separate variable names
    #   - See 1-concepts/1-language/array/2-reference-elements.sh
    #my_str="$@"
    #declare -p my_str # declare -- my_str="one two three"
    #printf '~%s~' "$my_str" # ~one two three~
    #echo ''
    #printf '~%s~' "${my_str[0]}" # ~one two three~
    #echo ''
    #printf '~%s~' "${my_str[1]}" # ~~
    #echo ''
    #printf '~%s~' "${my_str[2]}" # ~~
    #echo ''
    #printf '~%s~' "${my_str[3]}" # ~~
    #echo ''
    #printf '~%s~' "${my_str[e]}" # ~one two three~
}

ary=('one' 'two' 'three')
#declare -p ary # declare -a ary=([0]="one" [1]="two" [2]="three")
#printf '~%s~' "${ary[@]}" # ~one~~two~~three~
#echo ''
how_to_confuse_myself "${ary[@]}"
