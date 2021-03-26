#!/usr/bin/env bash

# - https://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/string-manipulation.html

# - Replacing substrings does not modify the original string
# - Syntax: ${<string>//<substring>/<replacement>}
replace_all_substrings() {
    # - This example removes all whitespace
    var='Hello    there     General  Kenobi !'
    printf '~%s~ ' ${var// /} # ~HellothereGeneralKenobi!~
    echo ''
    printf '~%s~ ' "$var" # ~Hello    there     General  Kenobi !~
}

replace_all_substrings
