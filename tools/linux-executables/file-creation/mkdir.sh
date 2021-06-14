#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Does not fail or modify directories if they already exist
recursively_make_subdirectories() {
    mkdir -p foo/bar/boo
}

recursively_make_subdirectories
