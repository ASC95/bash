#!/usr/bin/env bash
#trap 's=$?; echo "${0##*/}: Possible error somewhere in line "$LINENO": $BASH_COMMAND";' ERR

# - https://askubuntu.com/questions/513932/what-is-the-bash-command-variable-good-for - describes $BASH_COMMAND
# - https://medium.com/@dirk.avery/the-bash-trap-trap-ce6083f36700 - problem with trap and functions

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Technically, $? returns the exit status of the last executed foreground pipeline
#   - When $ set -o pipefail $ is not enabled, that's always the exit status of the last command in a pipeline
#   - When $ set -o pipefail $ is enabled, that's the exit status of the last command to exit with a non-zero exit status in the pipeline
get_exit_status_of_last_command() {
    #set -o pipefail
    grep 'no' 'no.txt' | sort
    printf '%s\n' "$?" # either 0 or 2
}

# - See bash/1-concepts/1-language/process-execution/3a-execute-vs-source.md
get_parent_shell_process_id() {
    printf '%s\n' "$$" # <integer>
}

# - See ... (I don't have notes on background job control right now)
get_process_id_of_most_recent_background_job() {
    printf '%s\n' "$!"
}

#get_exit_status_of_last_command
#get_parent_shell_process_id
get_process_id_of_most_recent_background_job