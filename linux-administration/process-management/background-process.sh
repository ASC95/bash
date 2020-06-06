#!/usr/bin/env bash

# - https://www.maketecheasier.com/run-bash-commands-background-linux/ - ways to run a background process
# - https://unix.stackexchange.com/questions/104821/how-to-terminate-a-background-process - how to end a background process
# - https://unix.stackexchange.com/questions/252349/what-is-the-difference-between-kill-pkill-and-killall - ways to kill process

# Format a command as $ <command> &
launch_background_process() {
    python &
}

# - Command: $ kill <PID>
# - Options:
#   - 9: immediately kills the process without giving it a signal to gracefully shut down
# - Notes:
kill_background_process_from_pid() {
    kill -9 <PID>    
}

# - Command: $ pkill <name>
# - Options:
#   - 9: hard kill (same as above)
# - Notes:
kill_background_process_from_name() {
    pkill -9 python
}