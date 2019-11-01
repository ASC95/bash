#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/17107/process-substitution-and-pipe
# http://mywiki.wooledge.org/BashGuide/InputAndOutput#Process_Substitution
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
# https://serverfault.com/questions/959441/why-am-i-getting-sh-dev-fd-63-permission-denied-process-substitution-anonymo

cd $(dirname "${BASH_SOURCE[0]}")

# A "named pipe" is just a pipe with a filename. It accomplishes the same task as a regular pipe, but with a temporary, named file instead. It is also
# referred to as a "FIFO". Process substitution uses a named pipe to store the output of a command, then passes the name of that file to whatever
# other command is expecting it. Once the command has finished, the temporary file is deleted. This all happens transparently to the user.
# - See the diff.sh notes for a good example

# When available, process substitution is performed simultaneously with parameter and variable expansion, command substitution, and arithmetic
# expansion. 

#

# <(<command>) writes the output of <command> to a temporary file. Think of it as <filename> < <command>
write_output_to_file() {
    cat <(printf '%s**' 'hello!') <(printf '%s?!' 'world!')
}

# >(<command>) is meant to be used in conjunction with another command. When it exists as a line by itself, the substitution occurs and then Bash
# >tries to execute the substitution as its own command
permission_denied_error() {
    # This is equivalent to $ ./dev/fd/63, so permission denied
    >(read my_var) 
}

# >(<command>) is used for cases where you're running a command that writes to a file, but you want it to write to another command instead
write_output_to_another_command() {
    #printf '%s' 'hello' > 'output.txt'
    printf '%s' 'goodbye' > >(read my_var; print '%s' "${my_var}") # I don't understand this at all. Come back later
}

#write_output_to_file
permission_denied_error
#write_output_to_another_command