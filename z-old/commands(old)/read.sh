#!/usr/bin/env bash

# http://linuxcommand.org/lc3_man_pages/readh.html
# https://stackoverflow.com/questions/4642191/read-line-by-line-in-bash-script
# https://stackoverflow.com/questions/4165135/how-to-use-while-read-bash-to-read-the-last-line-in-a-file-if-there-s-no-new


cd "$(dirname "${BASH_SOURCE[0]}")"

# - $ read $ does not write to stdout by itself

read_into_array() {
    read -a my_array
}

# The custom read-terminating-delimiter can only be a single character
custom_end_delimiter() {
    read -d '@' my_var
}

read_from_file_descriptor() {
    exec 9< read.sh
    # Note that the last line isn't read because read encountered EOF.
    # - This can be fixed by adding an \n at the end of the file
    while read -u 9 cool_var; do
        printf '%s\n' "$cool_var"
    done
}

#read_into_array; printf 'The array is: %s\n' "${my_array[*]}"; printf 'Second element: %s\n' "${my_array[1]}"
#custom_end_delimiter; printf 'my_var: %s\n' "my_var was: $my_var"
read_from_file_descriptor
