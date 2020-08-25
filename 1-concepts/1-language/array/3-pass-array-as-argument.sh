#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/Arrays?highlight=%28array%29
# - https://askubuntu.com/questions/674333/how-to-pass-an-array-as-function-argument
# - https://stackoverflow.com/questions/10806357/associative-arrays-are-local-by-default - apparently it's a bug that associative arrays created
#   within a function are local by default? However it seems to work fine on my machine. Associative arrays are global
# - https://temptemp3.github.io/bash-declare - more details on above

# - When used in a function, `declare' makes NAMEs local, as with the `local' command.  The `-g' option suppresses this behavior.
#   - So declare is implicitly local!

pass_normal_array() {
    ary=("$@")
    for i in "${ary[@]}"; do
        printf '~%s~ ' "$i"
    done
}

pass_normal_array_caller() {
    local ary=('one' 'two' 'three')
    # - This is what I want. The array is expanded into separate arguments BEFORE it is passed into the function. The function then collects all of
    #   the separate arguments into its own array, which I reference in the exact same way
    pass_normal_array "${ary[@]}"
}

# - An associative array respects the normal declare flags
#   - When an associative array is declared with -A, it is local to the function as expected
#   - When an associative array is declared with -g, it is global as expected
# - I don't see any bugs in Bash 5.0.17 
inspect_associative_array_scope() {

    reference_associative_array() {
        for k in "${!associative_array[@]}"; do
            printf 'Key: %s, Value: %s\n' "$k" "${associative_array[$k]}"
        done
    }

    create_associative_array() {
        #declare -A associative_array;
        declare -A -g associative_array;
        associative_array['hi']='hello'
        associative_array['bye']='goodbye'
        associative_array['what']='whatever'

        # - Called this way, this function CAN see the associative array because this function inherits the scope of the calling function within which
        #   the associative array was declared. Bash has proper nested function scope!
        #reference_associative_array
    }

    create_associative_array
    # - Called this way, this function cannot see the associative array because it is local to the function within which it is declare (assuming that
    #   -g was not used with declare)
    # - However, if the -g flag is used, then this function CAN see the associative array as expected
    reference_associative_array
}

# - Make sure to understand how scopes work. All of that applies to this example
get_associative_array() {
    # - This is how I can reference an associative array whose name was passed as a function
    declare -n wockawocka="$1"
    for k in "${!wockawocka[@]}"; do
        # - This is actually the correct syntax. Nice!
        printf 'Key: %s, Value: %s\n' "$k" "${wockawocka[$k]}"
        # - This is incorrect
        #printf 'Key: %s, Value: %s\n' "$k" "${ary[k]}"
    done
}

# - Passing an associative array is harder. Note that parameter indirection CANNOT accomplish the same thing as declare -n
get_associative_array_caller() {
    declare -A ass_ary;
    ass_ary['first']='one'
    ass_ary['second']='two'
    ass_ary['third']='three'
    # - This isn't always good enough because I might want to reference the keys of the associative array within the function
    #pass_normal_array "${ass_ary[@]}" # ~three~ ~one~ ~two~

    # - This is good when used in combination with declare -n
    get_associative_array 'ass_ary'

    # - I COULD access the associative array as "ass_ary" within this function, since this function inherits this scope, but the point is to show that
    #   passing the string name of the associative array is a valid way of passing it as an argument. Global variables are bad!
    #get_associative_array
}


#pass_normal_array_caller
#inspect_associative_array_scope
get_associative_array_caller
