#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/InputAndOutput

# - The $ export $ command is used to "store" an environment variable in a process so that spawned child processes will inherit it
#   - This is how programs run from my interactive terminal get important information from the shell
# - Environment variables are capitalized by convention
make_environment_variable_accessible_to_child_processes() {
    # - This environment variable will only be visible in my interarctive terminal if I source this script
    export MYFOO='foo'
}

# - $ declare $ can display the names defined in an environment
list_defined_names() {
    # - List all names
    #declare -p
    # - List only functions
    declare -F
}

# - Use $ unset $ to remove an environment variable
#   - Unset can unset any non-readonly variable or non-readonly function
#       - It can also unset either one through a name reference
remove_environment_variable() {
    #unset MYFOO
    declare -F
    echo ''
    unset remove_environment_variable
    declare -F
}

# - An environment variable can be set for a SINGLE process by putting the environment variable in front of the command
set_environment_variable_for_command() {
    LANG='es_MX.UTF-8' ls /nope
}


#make_environment_variable_accessible_to_child_processes
#list_defined_names
#remove_environment_variable
set_environment_variable_for_command