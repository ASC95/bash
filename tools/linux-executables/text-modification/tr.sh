#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - The output looks weird in the integrated terminal but it's fine in a regular terminal
strip_newline_from_output() {
    #pwd
    pwd | tr -d '\n'
}

strip_newline_from_output