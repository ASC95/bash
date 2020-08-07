#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - The -r flag is required to copy a directory 
copy_a_directory() {
    cp -r ../io .
}

copy_a_directory