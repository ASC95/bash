#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/317492/list-of-kill-signals

# - The default signal used by kill is SIGTERM (15), which is a soft, nice kill
#   - For example, use SIGTERM to send a signal to Cribl that will make Cribl shutdown after about 5 seconds when it finishes cleaning up what it was
#     doing
view_available_termination_signals() {
    kill -l
}

# - This is by far the safest way to handle this
sigterm_process_with_pid() {
    kill '<pid>'
}

# - I should avoid doing this as much as possible
sigterm_process_with_name() {
    pkill 'cribl'
}

#view_available_termination_signals
#sigterm_process_with_pid
sigterm_process_with_name