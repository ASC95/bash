#!/usr/bin/env bash

# - https://www.thegeekstuff.com/2009/09/unix-sed-tutorial-printing-file-lines-using-address-and-patterns/

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Flags:
#   -n: suppress automatic printing of the pattern space
# - Commands:
#   - p: print data from the pattern buffer
view_file() {
    # - The net result of this command is that the entire file is printed
    sed -n 'p' 'testfile.txt'
}

# - An address range limits the lines to which the command (in this case, printing) is applied
#   - The address range can itself be a regular expression, a start index and an end index, a regex + a number of times to match, etc.
#       - See $ man sed
filter_command_application_with_address_range() {
    # - The net result of this command is that only lines that contain "I am" are printed to stdout
    #   - It's like I'm using grep
    # - The address range is literally /I am/
    sed -n '/I am/ p' 'testfile.txt'
}

# - By default, sed always prints the results of the application of the command(s) to stdout unless the -n flag is used
view_results_of_command() {
    # - Even lines that weren't affected by the command are printed
    sed 's/line/duck/' 'testfile.txt'
}

#view_file
#inspect_output
view_results_of_command
