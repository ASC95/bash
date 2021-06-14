#!/usr/bin/env bash
set -uo pipefail

# - https://mywiki.wooledge.org/BashGuide/Arrays - ${ary[@]} vs. ${ary[*]}

# - Numeric arrays and associative arrays are expanded exactly the same with the same syntax
#   - This makes sense because expanding an array has nothing to do with its indexes

# - TLDR: always do "${ary[@]}"
#   - Recall that the IFS variable is the "internal field separator"
compare_expansion_techniques() {
    ary=('foo bar' 'is a' 'convention')
    # - Doing this is a mistake because each element undergoes word splitting according to the IFS
    printf '~%s~' ${ary[@]} # ~foo~~bar~~is~~a~~convention~
    echo ''
    # - This always expands each ELEMENT of the array into a SINGLE word, regardless of whether the element contains newlines, spaces, etc.
    #   - This is the preferred syntax for expanding an array
    printf '~%s~' "${ary[@]}" # ~foo bar~~is a~~convention~
    echo ''
    # - This always combines all of the elements into a single word, where each element is joined with the FIRST character of the IFS. It's useful for
    #   printing an array, but that's about it
    printf '~%s~' "${ary[*]}" # ~foo bar is a convention~
    echo ''
    # - I can set IFS within a subshell to select a character that should be used to join the elements
    #   - Remember that only the FIRST character of the IFS is used for this purpose
    (IFS=','; printf '~%s~' "${ary[*]}") # ~foo bar,is a,convention~
    echo ''
    # - Doing this is a mistake because the entire single word undergoes word splitting according to the IFS
    printf '~%s~' ${ary[*]} # ~foo~~bar~~is~~a~~convention~
}

# - The array expansion itself and the for-loop variable must always be double quoted to avoid splitting an array element into multiple words
#   - Thus, the Bash for-loop declaration is NOT a Bash keyword
#   - It seems like I could avoid double quoting if I set did IFS=$'\n\t' to exclude spaces, but what if the element contained a newline or tab?
expand_array_in_for_loop() {
    ary=('foo bar' 'is a' 'convention')
    for e in ${ary[@]}; do
        printf '~%s~\n' $e
    done;
}

# - Associative arrays don't expand in lexicographical order or reverse lexicographical order
#   - Don't rely on the order of expansion of associative arrays at all
expand_associative_array() {
    declare -A ary
    ary[a]='foo bar'
    ary[cc]='blah'
    ary[cb]='convention'
    ary[b]='is a'
    printf '~%s~' "${ary[@]}" # ~convention~~blah~~is a~~foo bar~
    echo ''
    printf '~%s~' "${ary[*]}" # ~convention blah is a foo bar~
}

#compare_expansion_techniques
#expand_array_in_for_loop
expand_associative_array