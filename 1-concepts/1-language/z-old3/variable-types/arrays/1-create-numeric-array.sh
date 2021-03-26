#!/usr/bin/env bash

# - If I start treating a variable as a numeric array, Bash recognizes it as such
#   - Be careful because this is usually a mistake. Notice that anything non-numeric evaluates to 0 in a numeric context (e.g. within the []), so
#     "foo" and "bar" both evalute to index 0!
#   - It's hard to catch this mistake because printing the variable will just show it's first element!
create_numeric_array() {
    some_tuple[foo]='foo'
    some_tuple[bar]='bar'    
    some_tuple[3]='3'
    declare -p some_tuple # declare -a some_tuple=([0]="bar" [3]="3")
    printf '%s\n' "$some_tuple" # bar
    # - This is how I should always create an array
    arr=('foo' 'bar')
    declare -p arr # declare -a arr=([0]="foo" [1]="bar")
}

# - The += operator can be used to append elements to a numeric Bash array
append_to_numeric_array() {
    ary=('hello' 'there')
    ary+=('general')
    ary+=('kenobi')
    declare -p ary # declare -a ary=([0]="hello" [1]="there" [2]="general" [3]="kenobi")
}

# - Do NOT create an array with commas! The commas make the array only contain a single element! I must use spaces to delineate elements
# - Remember (<expression>) ALWAYS creates an array!
#   - {<statements>} performs grouping!
do_not_create_array_with_commas() {
    ary=('one','two','three')
    for i in "${ary[@]}"; do
        printf '~%s~ ' "$i" # ~one,two,three~
    done
    echo ''
    ary=('one' 'two' 'three')
    for i in "${ary[@]}"; do
        printf '~%s~ ' "$i" # ~one~ ~two~ ~three~
    done
}