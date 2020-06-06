#!/usr/bin/env bash

# https://www.computerhope.com/unix/used.htm
# https://stackoverflow.com/questions/29760638/remove-white-space-in-bash-using-sed

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Syntax:
# - sed [-Ealn] <command> [file ...]
# - sed [-Ealn] [-e <command>] [-f command_file] [-i extension] [file ...]
#   - <command>: [address[,address]]<function>[arguments]

# sed command-line flags:
# -E: use ERE
# -e: append additional commands
# -n: disable the default behavior of echo-ing each processed line to stdout
#   - if the $ p $ function is used without the -n flag, each line gets output twice!

# sed functions:
# - p: print the processed input to stdout
# - s/<rgx1>/<rgx2>/[flags]: replace instances of <rgx1> with <rgx2>

# sed regex flags
# - g: global flag

# This seems like the easiest way to just add things to the output
format_output() {
    sed -E 's/^/~~/; s/$/@@/' 'testfile.txt'
}

trim_leading_whitespace() {
    sed -E 's/^[[:space:]]*//' 'testfile.txt'
}

# - Recall that the purpose of xargs is to transform stdout into string arguments
#   - I can't ignore spaces with xargs. ARGH!!! I have to output my lines from sed with quotes to protect against this
# - I can chain multiple commands together separated by semicolons
# - Remember: a replacement is only applied to the first match unless the g flag is used
# - The solution is to trim all non-alphanumeric characters from the beginning and end, then replace them with double quotes
trim_leading_whitespace_and_quotes_and_trailing_whitespace() {
    sed -E 's/^[^a-zA-Z0-9]*/"/; s/[^a-zA-Z0-9]*$/"/g' 'testfile.txt' | xargs printf '\-> %s \<-\n'
}

# Replace everything between the first and last slash with nothing
trim_filepath() {
    fp='/Users/austinchang/pycharm/omf/omf/static/publicFeeders/Simple Market System.omd'
    printf '%s' "$fp" | sed -E 's/\/.*\///'
}

format_output
#trim_leading_whitespace
#trim_leading_whitespace_and_quotes_and_trailing_whitespace
#trim_filepath