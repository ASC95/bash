#!/usr/bin/env bash

# - Two sets of double quotes are required: one inside of the command substitution so that $ dirname $ receives the correct arguments, and one around
#   the entire command substitution so that $ cd $ receives the correct arguments
#   - The innermost double quotes protect again filenames with spaces
#   - The outermost double quotes protect against immediate directories having spaces
# - The double quotes must be placed perfectly
#   - There must not be spaces between the innermost double quotes and ${BASH_SOURCE[0]}, because that would create a string that represents a
#     nonexistent file
#   - There must not be spaces between the outermost double quotes and $(...), because that would create a string that represents a nonexistent directory
cd "$(dirname "${BASH_SOURCE[0]}")"

view_script_name() {
    # This is the name of the .sh file, relative to where the execution command was run. It could be anything in between:
    # - get script dir.sh
    # - /Users/austinchang/tutorials/bash/common-tasks/get-script-dir.sh
    printf '%s\n' "${BASH_SOURCE[0]}" 
}

view_script_dir() {
    # Same rules as above, only this is the directory of the script
    printf '%s\n' "$(dirname "${BASH_SOURCE[0]}")"
}

# Make sure to use double quotes to prevent word splitting
# - Remember that the output of dirname could be almost anything, even "."
view_absolute_dir() {
    printf '%s\n' "$( dirname "${BASH_SOURCE[0]}" )" # ".", "common tasks", etc.
    cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd
}

# Order of processing:
# 1) Double-quoted state is applied to the outermost command
# - "$" character does not lose special meaning, which is why shell expansions can happen within double quotes
# 2) Redirection is applied to the outermost command, then the redirection operators are removed
#   - stdout -> /dev/nul
#   - stderr -> stdout -> /dev/null
# 3) Command substitution is evaluated. Shell expansion and other normal parsing operations happen inside the substitution
# 4) The stdout of the command substitution replaces the entire command substitution
# 5) The redirected "cd" command executes
#   - As far as I know, cd never writes to stdout. It only writes to stderr if a nonexistent directory was passed
# 6) If the first command executed successfully (returned with exit code 0), then the command after "&&" executes
# - The net result is that I changed to the directory of this script, then printed the absolute directory to stdout
view_absolute_dir_fancy() {
    cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd
}

#view_script_name
#view_script_dir
#view_absolute_dir
view_absolute_dir_fancy