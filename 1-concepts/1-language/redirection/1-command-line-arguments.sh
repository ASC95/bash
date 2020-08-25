#!/usr/bin/env bash

# - http://mywiki.wooledge.org/BashGuide/InputAndOutput - main guide on redirection
# - https://askubuntu.com/questions/368509/why-is-0-set-to-bash - "-bash" vs "bash" (i.e. login vs non-login shell)
# - https://bash.cyberciti.biz/guide/$0 - $0 parameter

# - See 1-language/parameters/positional-parameters.sh

# - $0 is a special parameter
#   - Normally, $0 expands to the name of the running shell or shell script (e.g. "bash")
#   - If the Bash executable (i.e. /bin/bash) is directly invoked with a file of commands, then $0 is set to the path/name of the file

printf 'The zeroth command-line argument was: %s\n' $0
printf 'The first command-line argument was: %s\n' $1
printf 'The second command-line argument was: %s\n' $2
printf 'The third command-line argument was: %s\n' $3

# - When a script is executed, then Bash itself is being invoked and is being passed the location of the script
#   - See 1-language/process-execution/3a-execute-vs-source.md
# - If Bash itself is invoked with a command-line argument that is a script to be executed, $0 is the filename of the corresponding script
#   - In this example, $0 changes depending on what directory this script was executed from
#       - E.g. ./1-command-line-arguments.sh
#       - E.g. redirection/1-command-line-arguments.sh

# austin@austin-Z390-UD:~/programming/tutorials/bash/1-concepts/1-language/redirection$ ./1-command-line-arguments.sh foo bar baz
# The zeroth command-line argument was: ./1-command-line-arguments.sh
# The first command-line argument was: foo
# The second command-line argument was: bar
# The third command-line argument was: baz

# austin@austin-Z390-UD:~/programming/tutorials/bash/1-concepts/1-language$ bash redirection/1-command-line-arguments.sh foo bar baz
# The zeroth command-line argument was: redirection/1-command-line-arguments.sh
# The first command-line argument was: foo
# The second command-line argument was: bar
# The third command-line argument was: baz

# - When a script is sourced, $0 retains is normal value of being the name of the running shell
#   - On Ubuntu, that's "bash" because Ubuntu runs a non-login shell by default
#   - On macOS, that's "-bash" because macOS runs a login shell by default

# austin@austin-Z390-UD:~/programming/tutorials/bash/1-concepts/1-language/redirection$ . 1-command-line-arguments.sh foo bar baz
# The zeroth command-line argument was: bash
# The first command-line argument was: foo
# The second command-line argument was: bar
# The third command-line argument was: baz

this_is_a_function() {
    # $0 is the same within a function
    printf '$0 was: %s\n' "$0"
    printf '$1 was: %s\n' "$1"
}

this_is_a_function 'whoa'
