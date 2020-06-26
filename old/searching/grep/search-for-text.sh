#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"


# - Command: $ grep [other flags] --exclude-dir="<pattern_1>" --exclude="<pattern_2>" <pattern_3> <path>
# - Options:
#   - exclude: exclude files that match the given pattern
#   - exclud-dir: exclude directories that match the given pattern  
# - Notes:
#   - Remember that the pattern to search for comes before the path that is being searched
exclude_path() {
    grep -rli --exclude-dir "*venv*" --exclude "*.pyc" "cron" .
}