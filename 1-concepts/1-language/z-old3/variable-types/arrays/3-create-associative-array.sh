#!/usr/bin/env bash

# - This is the only way to create an associative array
# - The $ declare $ keyword within a function is implicitly local, regardless of what's being created, as long as the -g flag isn't used
# - An associative array doesn't have to use integers for indexes, but it can
create_associative_array() {
    declare -A arr
    arr[target]='untopchan'
    arr[link]='/opt/splunk/etc/apps/untopchan'
    printf '%s\n' "arr[target]: ${arr[target]}"
    printf '%s\n' "arr[link]: ${arr[link]}"
    declare -p arr # declare -A arr=([link]="/opt/splunk/etc/apps/untopchan" [target]="untopchan" )
}

# - The += operator does NOT append to an associative array
#   - Instead, Bash raises an error
append_to_associative_array() {
    declare -A ary
    ary+=('dat')
    ary+=('boi')
    declare -p ary # declare -A ary=()
}

declare_multiple_associative_arrays() {
    declare -A arr0 arr1 arr2
    arr0[foo]='bar'
    arr1[foo]='dar'
    arr2[foo]='zar'
    printf 'arr%d[foo]: %s\n' 0 "${arr0[foo]}" 1 "${arr1[foo]}" 2 "${arr2[foo]}"
}

append_to_associative_array