#!/usr/bin/env bash

# - https://linuxhint.com/bash_declare_command/

# - The $ declare $ built-in allows me to modify properties of variables

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Without any options, $ declare $ just defines a variable
define_a_variable_in_longhand() {
    # This is longhand variable declaration in Bash. Normally, foo='bar' by itself is sufficient
    declare foo='bar'
    declare baz=''
    echo 'foo is: ' $foo # bar
    echo 'baz is: ' $baz # <nothing>
}

# - The -p option makes $ declare $ show the properties of a variable
#   - If I try to inspect an unset variable (i.e. a variable that evaluates to "", i.e. a null variable), $ declare $ exits with a status code of 1
examine_variable_and_attributes() {
    declare foo='bar'
    # The "--" string is where variable attributes go if there are any
    declare -p foo # declare -- foo="bar"
    echo "$?" # 0
    declare -p baz # baz not found
    echo "$?" # 1
}

# - The -n option makes declare create a "name reference" variable
#   - A name reference variable is merely a reference to another variable
#   - Using $ declare $ is the only way to do this
# - The variable name BEING referenced CAN be an unset variable, but it cannot be an invalid variable name (e.g. whitespace, null string, etc.)
create_reference_variable() {
    foo=1
    # The variable "bar" literally refernces what the variable "foo" points to
    declare -n bar=foo
    echo $foo # 1
    echo $bar # 1
    foo=3
    echo $foo # 3
    echo $bar # 3
    # Valid
    #declare -n bar=haha
    # Invalid
    #declare -n bar=''
    # Invalid
    declare -n bar=" "
}

# - These two blocks of code show how using $ declare -x $ has the same net effect as using $ export $
#   - Make sure to run these two code blocks separately!
export_variable_into_shell_context() {
    echo{,} 'bar is:' \${bar} > echo-bar.sh # See 1-language/brace-expansion/2-comma-separated-list.sh
    # Declared this way, bar only exists in this script's global context. External scripts cannot see it
    bar='What a cool value'
    bash echo-bar.sh #
    # Now bar has been exported to the shell so it will be in any external script's environment
    export bar
    bash echo-bar.sh # What a cool value

    #declare -x bar='What a cool value'
    #echo{,} 'bar is:' \${bar} > echo-bar.sh # See 1-language/brace-expansion/2-comma-separated-list.sh
    #bash echo-bar.sh # What a cool value
}

#define_a_variable_in_longhand
#examine_variable_and_attributes
create_reference_variable
#export_variable_into_shell_context
