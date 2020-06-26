# - https://unix.stackexchange.com/questions/359323/confused-about-the-meaning-of-unix-vs-bsd-flags-format-for-the-ps-command - different ps flag
#   formats (very interesting)
# - https://www.tecmint.com/ps-command-examples-for-linux-process-monitoring/ - many examples of ps usage, more than I want to show here
# - https://unix.stackexchange.com/questions/21280/difference-between-pts-and-tty - tty vs. pty
# - http://thelinuxstuff.blogspot.com/2012/08/process-state-codes-in-ps-output.html - process status code translation table

# - For historical reasons, ps takes both unix-format flags (those preceeded with a hyphen) and BSD-format flags (those without a preceeding hyphen).
#   See the first source for how ps handles mixing both styles of flags (it's pretty crazy)

# - This will show PID, TTY, TIME, CMD
#   - PID: the process ID
#   - TTY: presumably, this is the ID of the TTY that owns the process (if any)
#       - A tty is a native terminal device (the backend is either hardware or kernel emulated). A pts is the slave component of a pty, which is a
#         pseudo terminal device (a terminal device that is emulated by another program like xterm)
#       - I've never needed to care what the value of this column was
#   - TIME: this is the time that a process has actually used the CPU (i.e. total CPU utilization time)
#       - The time that a process waits for IO events is NOT counted
#           - This explains why the "bash" process almost always has a time of 00:00:00
#       - Running an infinite while-loop in a shell is a good way to increase the TIME field to greater than 0. "while" is an internal command (it
#         does not create a new process), so the time that a while-loop runs is tracked under the bash process itself
#       - I've never needed to care what the value of this column was
#   - CMD: the name of the executable file from which the command was loaded
display_basic_info_about_processes_in_current_shell_in_unix_format() {
    ps
}

# - The -e flag will show information about all processes that are running instead of just those under the current shell
display_basic_info_about_all_processes_in_unix_format() {
    ps -e
}

# - Using the -f option will add the UID, PPID, C, and STIME columns
#   - UID: the UID of the user who owns the process (alternatively, it's their username)
#   - PPID: the parent process ID
#   - C: an integer representation of the percentage of CPU utilization (e.g. 11 == 11%)
#   - STIME: the start time of the process in 24-hour format
#       - This could be a date if the proces was started a long time ago
display_detailed_info_about_all_processes_in_unix_format() {
    ps -ef
}

display_the_process_status_codes_of_processes_in_current_shell() {
    ps a
}

#display_basic_info_about_processes_in_current_shell_in_unix_format
#display_basic_info_about_all_processes_in_unix_format
#display_detailed_info_about_all_processes_in_unix_format
display_the_process_status_codes_of_processes_in_current_shell