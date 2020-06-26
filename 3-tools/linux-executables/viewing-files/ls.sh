#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/198452/exclude-one-directory-in-ls-matching-pattern/198455 - perform ls matching with excluded pattern

cd "$(dirname "${BASH_SOURCE[0]}")"

# Doing this relies on the use of the "PWD" environment variable
view_absolute_paths() {
    ls -d $PWD/*
}

view_absolute_paths