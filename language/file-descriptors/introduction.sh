#!/bin/bash

# https://mywiki.wooledge.org/FileDescriptor - this link links to other links that are useful
# https://catonmat.net/bash-one-liners-explained-part-three - looks useful might come back to it

# A file descriptor is a number that refers to an open file. A child process inherits the file descriptors of its parent process. Every process
# inherits three open file descriptors from its parent: 0 (stdin) which is opening for reading, and 1 (stdout) and 2 (stderr), which are open for
# writing. Shells use redirection to work with file descriptors.

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Whenever a command like "cat" or "read" is entered without any arguments, the command implicitly reads from stdin. Once cat gets some data from its
# file descriptor, it will do what it's supposed to: output to stdout. Pressing control + d sends the end-of-file (EOF) character to the terminal. This
# will cause cat to think that the file (which happens to be stdin) has closed. cat will stop reading and terminate, and Bash will see this and resume
# the prompt
cat_from_stdin() {
    cat
}

# cat opens a NEW file descriptor (i.e. NOT stdin) to the file, then reads the contents through the file descriptor
open_a_file_descriptor() {
    cat readfile.txt
}

# The "<" operator has modified cat's stdin FD so that the data source of stdin is readfile.txt instead of the keyboard
# - A new file descriptor was NEVER opened
cat_from_stdin_again() {
    cat < readfile.txt
}

# A redirection operator may be preceeded by a number. The number denotes the FD that will be changed, and the following argument denotes what the FD
# will be changed to.
modify_redirection_operators() {
    printf '%s\n' 'Wrote stuff' 1> writefile.txt # Change FD 1 (stdout) of printf to be the file instead of the keyboard
    printf '%s\n' 'Wrote stuff' >> writefile.txt # Stdout is the default for the ">" and ">>" operators, so this command is identical to the above in terms of the FD
    #printf < readfile.txt # printf apparently does not read from stdin at all, so this won't work
    cat 0< readfile.txt # Change FD 0 (stdin) of cat to be the file instead of the keyboard
    cat < readfile.txt # Stdin is the default for the "<" and "<<" operators, so this command is identical to the above
}

# When a file descriptor is redirected on the 'done' statement, it applies that redirection to the entire for-loop. In detail:
# - Bash opens/creates the file output.txt before the loop starts
# - Bash points FD 1 (which is stdout) to the open file
# - Any commands inside of the loop inherit all file descriptors from Bash
# - Bash closes the file when the loop terminates
the_weird_done_statement() {
    for file in $(ls)
    do
        printf '%s\n' "${file}"
    done 1> output.txt
}

#cat_from_stdin
#open_a_file_descriptor
#cat_from_stdin_again
#modify_redirection_operators
the_weird_done_statement