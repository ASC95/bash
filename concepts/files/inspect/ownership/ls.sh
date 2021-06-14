#!/usr/bin/env bash

# - It's never a good idea to parse the output of ls, but for visual inspection this works
view_directory_owner_and_group() {
  ls -ld /home/austin/.local/share/Trash/files/splunk
}

view_directory_owner_and_group