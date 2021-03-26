#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Use the -k option to keep the original file
compress_file_and_keep_original() {
    gzip -k 'oracle_vbox_2016.txt'
}

compress_file_and_keep_original