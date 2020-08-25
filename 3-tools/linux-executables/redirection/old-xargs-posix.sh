#!/usr/bin/env bash

# - https://stackoverflow.com/questions/6958689/calling-multiple-commands-with-xargs

cd "$(dirname "${BASH_SOURCE[0]}")"



# - Now I understand what the -0 flag does: each argument is literally terminated with the null character (which I assume is represented by $ in the
#   output)
#   - Importantly, this shows that this flag does NOT fix the issue where I want to use a command that accepts ONLY one argument (e.g. odt2txt only
#     accepts a single filename)
terminate_with_null_character_instead_of_space() {
    cd ~
    # - Output: printf '~%s~ '
    #   'Android'$'\n''AndroidStudioProjects'$'\n''Desktop'$'\n''Documents'$'\n''Downloads'$'\n''keymaptable'$'\n''Music'$'\n''Pictures'$'\n''programming'$'\n''Public'$'\n''scratch.txt'$'\n''snap'$'\n''Templates'$'\n''Videos'$'\n''VirtualBox
    #   VMs'$'\n'
    #printf '%s\n' * | xargs -0p printf '~%s~ '

    # - Output:
    # ~Android
    # AndroidStudioProjects
    # Desktop
    # Documents
    # Downloads
    # keymaptable
    # Music
    # Pictures
    # programming
    # Public
    # scratch.txt
    # snap
    # Templates
    # Videos
    # VirtualBox VMs
    # ~
    printf '%s\n' * | xargs -0 printf '~%s~ '
}

# - Use the -n flag to specify the number of arguments that the command is permitted to be called with
#   - THIS is how I can invoke the command for every argument
# - 
invoke_command_for_each_argument() {
    cd ~
    #printf '%s\n' * | xargs -p -n 1 printf '~%s~ '
    #printf '%s\n' * | xargs -n 1 printf '~%s~ '
    printf '%s\n' * | xargs -p -0 -n 1 printf '~%s~ '
}





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

    ls | { read my_var; echo "$my_var"; }

    #ls | xargs >(read my_var)
    #ls | read my_var && echo "$my_var"
    #ls | xargs -I read my_var; printf "%s\n" ${#my_var} | cut -c 1-3
}

#visualize_arguments
terminate_with_null_character_instead_of_space
#invoke_command_for_each_argument
