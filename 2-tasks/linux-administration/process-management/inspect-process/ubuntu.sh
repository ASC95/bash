#!/usr/bin/env bash

# - https://linuxconfig.org/how-do-i-display-user-id-associated-with-a-process

# - The -p flag ensures that only information about the process with PID <pid> will be printed
get_basic_process_info() {
    ps -p 11937
}

# - Generally, I prefer ps to pgrep because I feel like ps is more trustworthly
#   - However, my fears are probably unfounded 
#   - pgrep will output its results in a nicer format that is better for piping, so it is still useful
#   - pgrep doesn't show itself in its own output which is nice
get_pid_of_process_with_process_name() {
    # - Use the -a flag to display the full command-line command string instead of just the name of the file from which the process was loaded
    pgrep -a "cribl"
    #printf '%s\n'
    #ps -ef | grep 'cribl'
    #ps -ef | grep 'cribl' | awk '// {print $2}'
}

get_basic_process_info
printf '\n'
get_pid_of_process_with_process_name