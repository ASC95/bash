#!/bin/bash

# https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html#Shell-Scripts - $0
# https://askubuntu.com/questions/368509/why-is-0-set-to-bash - what is "-bash"?

# If Bash itself is invoked with a command-line argument that is a script to be executed, $0 is the filename of the corresponding script. $0 could be:
# - ./script-name.sh
# - functions/script-name.sh
# - etc.
#
# If the output of echo $0 command is "-bash" it means that Bash was invoked as a login shell. 
# - If some Bash commands are directly executed in the shell, $0 is "-bash" becuase I'm executing in a login shell (on macOS)
# - If the script is sourced, $0 is "-bash" for the exact same reason
#
# Don't use $0 for anything!
view_filename_or_shell_name() {
    echo "\$0" was $0
}