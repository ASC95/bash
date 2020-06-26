#!/usr/bin/env bash

# - https://support.apple.com/en-us/HT204012 - macOS su
# - https://linuxacademy.com/blog/linux/linux-commands-for-beginners-sudo/ - sudo beginner intro
# - https://unix.stackexchange.com/questions/26074/is-there-a-way-to-stop-having-to-write-sudo-for-every-little-thing-in-linux - alternatives to using
#   sudo

# The root user has privileges to modify almost every file on the system, including those needed by the operating system. This is why it is a bad idea
# to login as the root user via $ su $: if I make a mistake as the root user, the consequences could be catastrophic. $ sudo $ is a safer alternative
# to $ su $ because $ sudo $ only runs the specified command with elevated privileges
# - The root user is disabled on macOS by default. This is why $ su $ doesn't work. However, the root user can be enabled

# Things I have observed while using $ sudo $:
# - The owner of a created file or directory is set to "root" instead of "austinchang"
# - Package installation done with sudo installs the files in a different directory thatn installation done as a regular user? (I want more details on
#   this)

# - Command: $ su
# - Options:
# - Notes:
#   - Doesn't work on macOS by default
become_root() {
    su
}

# $ sudo su - splunk