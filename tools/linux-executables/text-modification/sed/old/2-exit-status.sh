#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - sed will exit with 0 even if it didn't do anything to some text, unlike grep which will exit with 1 if it didn't find a match
fail_to_find_matches() {
    sed 's/hello/goodbye/' 'testfile.txt'
    printf '\n'
    printf '%s\n' "$?" # 0
}

fail_to_find_matches