# https://stackoverflow.com/questions/22709371/backticks-vs-braces-in-bash
# https://stackoverflow.com/questions/21331042/when-does-command-substitution-spawn-more-subshells-than-the-same-commands-in-is - very, very worth
# reading
# https://stackoverflow.com/questions/2676507/printf-example-in-bash-does-not-create-a-newline - command substitution removes TRAILING newlines

# $(...) is command substitution, NOT process substitution (i.e. <(...) or >(...))

# - $(<command>) performs command substitution. The stdout of <command> is substituted as the string for the corresponding outer command
#   - (...) performs subshell command grouping. This is completely separate from command substitution 
#   - ${<variable>} performs variable expansion. Variable expansion happens before command substitution.

# Use this syntax because its 1) easier to read 2) can be nested
preferred_syntax() {
    echo dirname ${BASH_SOURCE[0]} # dirname /Users/austinchang/tutorials/bash/parser-operations/command-substitution.sh
    echo $(dirname ${BASH_SOURCE[0]}) # /Users/austinchang/tutorials/bash/parser-operations
}

# Don't use this syntax even if it's valid
alternative_syntax() {
    echo `dirname ${BASH_SOURCE[0]}` # /Users/austinchang/tutorials/bash/parser-operations
}

# Command substitution implicitly removes any trailing newlines from the stdout of the inner command before that stdout is used as string arguments
# to the outer command
command_substitution_removes_trailing_newlines() {
    # This example has a trailing newline produced by the inner command
    # Expected output:
    # Hello there!
    # 
    # ~~~
    # Actual output:
    # Hello there!
    # ~~~
    #printf '%s\n~~~' "$(printf '%s\n' 'Hello there!')"

    # This example does not have a TRAILING newline produced by the inner command. Embedded newlines are not deleted by command substitution, but
    # could be deleted by word splitting
    # Expected and actual output:
    # Hello there!
    # @@@
    # ~~~
    printf '%s\n~~~' "$(printf '%s\n@@@' 'Hello there!')"
}

# Once ALL the stdout of the inner command(s) have been transformed into strings, THEN ALL of those strings are supplied to the outer command
# 1) $(...) -> Hello there! \n @@@
# 2) printf '%s\n~~~' Hello there! \n @@@
# 3a) Hello\n~~~
# 3b) there!\n~~~
# 3c) @@@\n~~~
# - Word splitting uses the IFS to split up command arguments. Since '\n' and ' ' are both in the default IFS, printf doesn't print them because they
#   are used by word splitting to deliniate arguments, then discarded
command_substitution_with_multiple_outputs() {
    printf '%s\n~~~' $(printf '%s \n @@@' 'Hello there!')
}

#preferred_syntax
#alternative_syntax
#command_substitution_removes_trailing_newlines
command_substitution_with_multiple_outputs