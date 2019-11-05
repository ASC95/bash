#!/usr/bin/env bash

# These notes are about command substitution (i.e. $(...)), not subshell command grouping (i.e. (...))
# - Recall that command substitution takes the stdout of the inner commands and uses them as string inputs to the corresponding outer command

# If redirection is applied within a command substitution, the results are as expected
redirect_inside_command_substitution() {
    printf '%s~\n' "$(printf '%s' 'hello from inner command')" # hello from inner command~ 
    # The output of the inner commands was swallowed
    printf '%s~\n' "$(printf '%s' 'hello from inner command' > /dev/null)" # ~
}

# Order of processing:
# 1) The command substituion is replaced by string arguments
#   - Thus, we would never see output from the inner command(s) appear in the current shell stdout anyway
# 2) The redirection is applied to the appropriate command.
#   - Redirection only ever applies to a single command or a single group of commands
# 3) The redirected command executes as normal
redirect_outside_command_substitution() {
    # Redirect the second command
    printf '%s!\n' 'reindeer' && printf '%s~\n' "$(printf '%s' 'hello from inner command')" > /dev/null # reindeer!
    # Redirect the entire group
    { printf '%s!\n' 'reindeer' && printf '%s~\n' "$(printf '%s' 'hello from inner command')" ;} > /dev/null
    # Redirect the entire group
    ( printf '%s!\n' 'reindeer' && printf '%s~\n' "$(printf '%s' 'hello from inner command')" ) > /dev/null
}

#redirect_inside_command_substitution
redirect_outside_command_substitution