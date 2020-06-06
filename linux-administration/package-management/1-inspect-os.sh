#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/88644/how-to-check-os-and-version-using-a-linux-command

# - Command: $ uname -a
# - Options:
#   - a: shortcut to include all other options
# - Notes:
#   - $ uname $ prints the operating system name, release, and version
#   - It does not print the Linux distribution
#   - It seems to work on all distributions?
inspect_operating_system() {
    uname -a
}

# - Command: ?
# - Options:
# - Notes:
#   - Here are some alternative commands that don't work on every distribution:
#       - $ lsb_release -a
#       - $ cat /etc/lsb-release 
inspect_linux_distribution() {
    cat /etc/redhat-release # Red Hat Linux
}

inspect_operating_system