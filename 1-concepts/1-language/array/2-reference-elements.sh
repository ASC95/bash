#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/Arrays
# - https://stackoverflow.com/questions/14525296/how-do-i-check-if-variable-is-an-array - the only way to "check" if a variable is an array is to use
#   declare and pattern matching. It's even more complicated than that!
# - https://stackoverflow.com/questions/29161323/how-to-keep-associative-array-order - associative arrays are stored in "hash" order. Don't rely on
#   ordering within associative arrays

# - It's super easy to accidentally pass a string and think that it's an array!
#   - Bash takes so much mental energy to write. It's horrible

# - Why is it legal to reference a string as if it were an array? What is going on here?
#   - NOBODY TALKS ABOUT THIS
#   - I'm guessing that within the brackets [], there is an arithmetic context
#       - That's why putting letters inside of the brackets evaluates to 0
#   - The source says that a string holds a single element, so that element MUST be stored at index 0
confusingly_reference_string_as_array() {
    string='foo bar         baz blah'
    printf '${string[0]}: %s\n' "${string[0]}"      # foo bar         baz blah
    printf '${string[1]}: %s\n' "${string[1]}"      # <nothing>
    printf '${string[2]}: %s\n' "${string[2]}"      # <nothing>
    printf '${string[3]}: %s\n' "${string[3]}"      # <nothing>
    printf '${string[e]}: %s\n' "${string[e]}"      # foo bar         baz blah
    printf '${string[a2f]}: %s\n' "${string[af2]}"  # foo bar         baz blah
    echo ''
    printf '$string[0]: %s\n' "$string[0]"   # foo bar         baz blah[0]
    declare -p string

    ary=('foo' 'bar' 'baz' 'blah')
    declare -p ary
}

# - Referencing a nonexistent element just returns null for the value
#   - Horrible!
reference_nonexistent_element() {
    ary=('one' 'two' 'three')
    printf 'e: %s\n' "${ary[0]}" # one
    printf 'e: %s\n' "${ary[1]}" # two
    printf 'e: %s\n' "${ary[2]}" # three
    printf 'e: %s\n' "${ary[3]}" # <nothing>
}

# - It is really easy to do line 45 and line 46 on a string and THINK that I either have a messed up array or a full array!
confuse_array_and_string() {
    string='foo bar baz'
    printf '%s\n' "$string" # foo bar baz
    printf '%s\n' "${string[0]}" # foo bar baz
    printf '%s\n' "${string[@]}" # foo bar baz

    ary=('foo' 'bar' 'baz')
    printf '%s\n' "$ary" # foo
    printf '%s\n' "${ary[0]}" # foo
    printf '~%s~' "${ary[@]}" # ~foo~~bar~~baz~
}

# - "$@" is not the problem
#   - See 1-concepts/1-language/parameters/positional-parameters.sh
# - Creating multiple global variables WAS the problem
#   - See 1-concepts/1-language/variables/scope/2-global-variable-madness.sh
reference_positional_parameter_array() {
    ary=("$@")
    declare -p ary # declare -a ary=([0]="one" [1]="two" [2]="three")
    printf '~%s~' "$ary" # ~one~
    echo ''
    printf '~%s~' "${ary[0]}" # ~one~
    echo ''
    printf '~%s~' "${ary[1]}" # ~two~
    echo ''
    printf '~%s~' "${ary[2]}" # ~three~
    echo ''
    printf '~%s~' "${ary[3]}" # ~~
    echo ''
    printf '~%s~' "${ary[e]}" # ~one~
}

# - Associative array keys are stored in hash order (see source)
# - See 1-concepts/1-language/parameters/positional-parameters.sh
reference_associative_array() {
    declare -A arr
    arr[target]='untopchan'
    arr[link]='/opt/splunk/etc/apps/untopchan'
    echo "$arr" # <nothing>
    echo "${arr[0]}" # <nothing>
    echo "${arr[target]}" # untopchan
    echo "${arr[link]}" # /opt/splunk/etc/apps/untopchan
    echo "${arr[@]}" # /opt/splunk/etc/apps/untopchan untopchan
}

#confusingly_reference_string_as_array
#reference_nonexistent_element
#confuse_array_and_string

#my_ary=('one' 'two' 'three')
#declare -p ary # declare -a ary=([0]="one" [1]="two" [2]="three")
#printf '~%s~' "${ary[@]}" # ~one~~two~~three~
#reference_positional_parameter_array "${my_ary[@]}"

reference_associative_array
