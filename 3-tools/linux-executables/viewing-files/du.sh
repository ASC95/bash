#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - https://stackoverflow.com/questions/16661982/check-folder-size-in-bash

view_directory_disk_space() {
    cd ../../
    # This shows output for each folder within the folder
    #du -h linux-executables
    # This shows output for just the top-level folder
    du -hcs linux-executables
}

view_directory_disk_space
