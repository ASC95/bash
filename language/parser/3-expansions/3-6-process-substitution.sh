#!/usr/bin/env bash

# https://tiswww.case.edu/php/chet/bash/bashref.html#Process-Substitution
# http://mywiki.wooledge.org/BashGuide/InputAndOutput#Process_Substitution
# https://unix.stackexchange.com/questions/376059/send-eof-to-named-pipe-cleaning-up-drying-up-fifo - I wish I understood this better. I need more OS
# knowledge
# http://tldp.org/LDP/abs/html/process-sub.html - examples of >()

cd "$(dirname "${BASH_SOURCE[0]}")"

# A "named pipe" is just a pipe with a filename. It accomplishes the same task as a regular pipe, but with a temporary, named file instead. It is also
# referred to as a "FIFO". Process substitution uses a named pipe to store the output of a command, then passes the name of that file to whatever
# other command is expecting it. Once the command has finished, the temporary file is deleted. This all happens transparently to the user.
# - See the diff.sh notes for a good example

# When available, process substitution is performed simultaneously with parameter and variable expansion, command substitution, and arithmetic
# expansion. 

# $ <external command> <(<internal command>) $ writes the output of <internal command> to a temporary file. That temporary file is then consumed by
# <external command>
# - Think of it as <internal command> > <filename> && <external command> <filename> && rm <filename>
create_temp_file_external_consumption() {
    cat <(printf '%s**' 'hello!') <(printf '%s?!' 'world!')
}

# >(<command>) is meant to be used in conjunction with another command. When it exists as a line by itself, the substitution occurs and then Bash
# tries to execute the substitution as its own command
permission_denied_error() {
    # This is equivalent to $ ./dev/fd/63, so permission denied
    >(read my_var) 
}


# I honestly do not understand the >() syntax still
create_file_internal_consumption() {
    printf '%s\n' 'Goodbye world' > >(cat)
}

create_temp_file_external_consumption
permission_denied_error