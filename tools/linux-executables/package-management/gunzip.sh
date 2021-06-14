#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/156261/unzipping-a-gz-file-without-removing-the-gzipped-file
# - https://unix.stackexchange.com/questions/93139/can-i-zip-an-entire-folder-using-gzip

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Decompressing a gzipped file is really simple
#   - Remember that gzip is a compression tool for files only. Use tar to make an archive, then gzip the archive if I want to "gzip a directory"
# - Gzipped files typically end in *.gz
g_unzip_file() {
    gunzip <file>
}