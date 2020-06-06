#!usr/bin/env bash

# - Command: $ pgrep <string>
# - Options:
#   - f: match against full argument lists (as opposed to just process names)
#       - This option is good to use
# - Notes:
#   - pgrep returns the PIDs of processes whose names matched <string> 
#   - By default, pgrep only matches against process names
#
# - Command: 
#   - $ ps
#   - $ ps -p <PID>
# - Options:
#   - p: view the process information of the given PID
#   - f: display more information about process(es)
#   - e: display information about other user's processes, instead of just those of the current user
#       - This options seems to thrown the "-p" option out of the window
#   - c: show just the executable name instead of the full command
# - Notes:
#   - ps is great, except that the amount of information it provides is overwhelming
#   - There doesn't appear to be a clean way to change whether the UID or username is shown
selectively_view_processes() {
    pgrep -f python | xargs ps -efp
}

selectively_view_processes