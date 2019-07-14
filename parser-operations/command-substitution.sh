# https://stackoverflow.com/questions/22709371/backticks-vs-braces-in-bash

# $(<command>) performs command substitution. The output of <command> replaces the string of the command name.
# ${<variable>} performs variable expansion. Variable expansion happens before command substitution.

# Use this syntax because its 1) easier to read 2) can be nested
preferred_syntax() {
    echo dirname ${BASH_SOURCE[0]} # dirname /Users/austinchang/tutorials/bash/parser-operations/command-substitution.sh
    echo $(dirname ${BASH_SOURCE[0]}) # /Users/austinchang/tutorials/bash/parser-operations
}

# Don't use this syntax even if it's valid
alternative_syntax() {
    echo `dirname ${BASH_SOURCE[0]}` # /Users/austinchang/tutorials/bash/parser-operations
}

preferred_syntax
alternative_syntax