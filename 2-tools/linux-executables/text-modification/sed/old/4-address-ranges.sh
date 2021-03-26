#!/usr/bin/env

# - https://stackoverflow.com/questions/11958369/replace-only-if-string-exists-in-current-line
# - https://stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file

cd "$(dirname "${BASH_SOURCE[0]}")"

# - By chaining multiple sed commands together and/or using address arguments, I can avoid the need for more complex PCRE constructs like lookarounds
#   that aren't available with sed

# - Flags:
#   -i[<suffix>]: make the changes to the file in-place
#       - If a <suffix> is provided, then a backup file is created with that suffix while the edits are being made
#   -e '<commands>': add the <commands> to the total group of commands to be executed
#       - This flag is redundant if I'm doing everything within one group of quotes

# - All sed commnads can take an optional address range that determines where the command will be used. This address range can itself be a regular
#   expression
replace_first_instance_in_line() {
    # - /I am/ is the address range. That means any line that contains "I am" anywhere inside of it will have the subsequent command (in this case,
    #   substitution) applied to it. Whether or not the command does anything is orthoganol to the address range
    # - Since the g flag isn't used at the end of the regular expressions, only the first instance of "line" per-line OF lines targeted by the address
    #   range will be substituted
    sed '/I am/ s/line/duck/' 'testfile.txt'
}

# - The optional address range argument of a command can be used to limit the application of that command (e.g. substitution) to a particular part of
#   some text/file
replace_first_instance_in_file() {
    # - The address range is 0,/line/. 0 (i.e. a GNU-specific specifier for the start of the file) is the start of the address and /line/ is the end of the
    #   address. The net result is that only the first instance of "line" in the entire file is replaced
    sed '0,/line/ s/line/duck/' 'testfile.txt'

    # - Curly braces can be used instead of spaces
    # - Additionally, the address and the command can be mashed together without spaces but that's confusing
    #sed '0,/line/{s/line/duck/}' 'testfile.txt'
}

replace_first_instance_in_line
#replace_first_instance_in_file
