#!/usr/bin/env bash

# - 

cd "$(dirname "${BASH_SOURCE[0]}")"

# - See 2-methods/inspect.sh to understand -n and p
# - Each command can have an address range prepended to it
#   - E.g. p has the address range "1,2", which means print lines 1 and 2
#   - E.g. p has the address range "6,7", which means print lines 6 and 7
# - Multiple commands must be separated by a semicolon
# - The address range can be a regular expression, a start index and an end index, a regex + a number of times to match, etc.
#   - See $ man sed
print_certain_line_numbers() {
    sed -n '1,2p;6,7p' '../testfile.txt'
}

print_certain_line_numbers