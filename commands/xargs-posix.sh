#!/usr/bin/env bash

# https://stackoverflow.com/questions/6958689/calling-multiple-commands-with-xargs

cd $(dirname "${BASH_SOURCE[0]}")

# - xargs transforms stdin into program arguments (i.e. strings)
# - It is only possible to specify a custom delimiter with GNU xargs unfortunately

# By default, xargs uses spaces, tab, newlines, and EOF as delimiters.
# - In the terminal, $ ls $ will output entires separated by tab characters. xargs can work with a single string of tab-delimited values just fine. If
#   I force $ ls $ to output with newline delimiters instead of tabs, xargs parses it the same way
ls_and_xargs() {
    ls -a | xargs printf '%s\n'
    #ls -1a | xargs printf '%s\n'
}

# The xargs output is sent to the first command in a pipe on the right side
multiple_commands() {
    ls
    printf '%s\n'
    ls | xargs -I ~UwU~ printf '%s\n' ~UwU~ # fun with -I option
    printf '%s\n'
    #ls | xargs printf '%s\n' | cut -c 1-3

    ls | { read my_var; echo "$my_var" }

    #ls | xargs >(read my_var)
    #ls | read my_var && echo "$my_var"
    #ls | xargs -I read my_var; printf "%s\n" ${#my_var} | cut -c 1-3
}

#ls_and_xargs
multiple_commands