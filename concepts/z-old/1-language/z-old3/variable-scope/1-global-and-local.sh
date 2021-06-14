#!/usr/bin/env bash

# - https://linuxize.com/post/bash-functions/

# - I should be able to run each example function completely independently of the others

# - By default, all variables are global, even those declared within a function
make_global_foo() {
    foo='bar'
    echo $foo # bar
}

# - Use the $ local $ keyword to make a variable explicitly local to its function
function make_local_baz { local baz='baz'; echo $baz; } # baz

# - $ unset $ unsets the innermost matching variable and stops there
#   - If there is a global foo and a local (i.e. function scope) foo and unset is called in the local scope, then it finds the local foo first and
#     unsets it. The global foo is left alone
#   - If there is only a global foo, then even though unset is called in the local scope it still unsets the global foo
# - This example has more to do with unset than it does with variable scope, but whatever
shadow_global_foo() {
    echo 'foo is:' $foo # foo is: bar
    local foo='hello'
    echo 'foo is:' $foo # foo is: hello
    unset foo
    echo 'foo is:' $foo # foo is:
}

#make_global_foo
#echo $foo # bar

#make_local_baz
#echo $baz # <nothing>

#foo='bar'
#shadow_global_foo
#echo 'foo is:' $foo # foo is: bar