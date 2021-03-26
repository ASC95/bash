#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/Arrays?highlight=%28array%29
# - https://stackoverflow.com/questions/11233825/multi-dimensional-arrays-in-bash - Bash does not natively support multidimensional arrays
# - http://mywiki.wooledge.org/BashFAQ/006 - don't use indirection as a hack to create/use multidimensional arrays. Use an associative array instead








# - Bash does not natively support multidimensional arrays
#   - I guess I'll stick with raw tuples and functions!
# - Alternatives:
#   - (<symlink1>,<target1>,<symlink2>,<target2>,...)
#       - Better hope no one ever forgets to add or remove just a target or a symlink, or adds a target or symlink out of order!
#   - declare -A arr
#     arr[<target1>]=<symlink1>
#     arr[<target2>]=<symlink2>
#       - Better hope that no target is ever used twice. If symlinks were used as keys, better hope no symlink was ever used twice!
#   - (<symlink1>,<symlink2>,...)
#     (<target1>,<target2>,...)
#       - Better hope no one ever forgets to add or remove just a target or a symlink, or adds a target or symlink out of order!
#   - ("<symlink_target_tuple1_name>",<symlink_target_tuple2_name>,...)
#       - Better hope 1) people understand what Bash indirection is and 2) no one ever changes a variable name!

# - This is not possible and this example is a futile exercise
create_array_of_arrays() {
    tuple1=('foo one','foo 1')
    tuple2=('foo two','foo 2')
    tuple3=('foo three','foo 3')
    tuple_container=("$tuple1","$tuple2","$tuple3")
    for i in "${!tuple_container[@]}"; do
        printf '%s\n' "Tuple index: $i"
        printf '%s\n' "Tuple contents: ${tuple_container[$i]}"
    done
}

#create_numeric_array
#append_to_numeric_array
#do_not_create_array_with_commas
#declare_associative_array
append_to_associative_array
#declare_multiple_associative_arrays
#create_array_of_arrays