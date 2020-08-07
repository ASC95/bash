#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

recursively_make_subdirectories() {
    mkdir -p foo/bar/boo
}

recursively_make_subdirectories
