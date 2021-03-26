#!/usr/bin/env bash

# - http://mywiki.wooledge.org/WordSplitting?highlight=%28word%29%7C%28splitting%29 - describes word splitting

# - The ${<array name>[@]} syntax is special syntax that expands an array
#   - See 1-language/parser/word-splitting/4-array-context.sh
#   - See ...

# - If I don't want each element of an array to undergo word splitting, then I need to double quote the array
do_not_word_split_array_elements() {
    var1='red cat'
    var2='blue dog'
    var3='green frog'
    ary=("$var1" "$var2" "$var3")
    printf '~%s~ ' "${ary[@]}" # ~red cat~ ~blue dog~ ~green frog~
}

# - If I want each element of an array to undergo word splitting, then I should NOT double quote the array
word_split_array_elements() {
    var1='red cat'
    var2='blue dog'
    var3='green frog'
    ary=("$var1" "$var2" "$var3")
    printf '~%s~ ' ${ary[@]} # ~red~ ~cat~ ~blue~ ~dog~ ~green~ ~frog~
}

#do_not_word_split_array_elements
word_split_array_elements
