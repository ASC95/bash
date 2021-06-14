#!/usr/bin/env bash
set -uo pipefail

# - https://mywiki.wooledge.org/BashGuide/Arrays

# - Both numeric and associative arrays can be examined with the same syntax
count_number_of_array_elements() {
    ary=('foo' 'bar' 'baz boo')
    printf '%s\n' "${#ary[@]}" # 3
    declare -A ass
    ass[foo]='foo'
    ass[bar]='bar'
    ass[baz]='baz boo'
    printf '%s\n' "${#ass[@]}" # 3

}

count_number_of_array_elements