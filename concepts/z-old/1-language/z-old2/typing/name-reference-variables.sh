#!/usr/bin/env bash

# - When a name reference variable is created with $ declare -n $, examining the contents of that variable with $ declare -p $ is not useful
create_name_reference_variable() {
    local ary=('seven' 'eight' 'nine')
    declare -n foo=ary
    printf '~%s~ ' "${foo[@]}" # ~seven~ ~eight~ ~nine~
    printf '\n'
    declare -p foo # declare -n foo="ary"
}

create_global_variable() {
    ary=('one' 'two' 'three')
    declare -p ary # declare -a ary=([0]="one" [1]="two" [2]="three")
}

# - Since the "ary" variable created by create_global_variable is globally scoped, I can create a name reference variable that refernces it
reference_global_variable() {
    declare -n foo=ary
    printf '~%s~ ' "${foo[@]}" # ~one~ ~two~ ~three~
}

create_local_variable() {
    local ary=('four' 'five' 'six')
    declare -p ary # declare -a ary=([0]="four" [1]="five" [2]="six")
}

# - Since the "ary" variable created by create_local_variable is function scoped (a.k.a. locally scoped), it is not accessible outside of the function
#   and therefore I cannot create a reference to it in another function
reference_local_variable() {
    declare -n foo=ary
    printf '~%s~ ' "${foo[@]}" # ~~
}

# - All variables created with $ declare $ are implicitly local. Thus, this "ary" is not accessible outside of this function. Try removing just the
#   $ declare -a $ part to prove this
create_indexed_array() {
    declare -a ary=('ten' 'eleven' 'twelve')
    declare -p ary # declare -a ary=([0]="ten" [1]="eleven" [2]="twelve")
}

#create_name_reference_variable
#create_global_variable && reference_global_variable
#create_local_variable && reference_local_variable
create_indexed_array && reference_local_variable