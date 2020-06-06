#!/usr/bin/env bash

# https://stackoverflow.com/questions/41979361/why-is-it-dangerous-to-have-777-files

cd "$(dirname "${BASH_SOURCE[0]}")"

# https://askubuntu.com/questions/152001/how-can-i-get-octal-file-permissions-from-command-line - linux octal permissions
# https://stackoverflow.com/questions/14854265/unix-linux-mac-osx-get-permission-of-file-as-number/14855227#14855227 - macOS octal permissions

# - Recall that:
#   - 1 is execute
#   - 2 is write
#   - 4 is read
# - Permissions of 755 for a file indicate:
#   - 7: read, write, execute for owner
#   - 5: read and execute for group
#   - 5: read and execute for world
# - Files typically have default permissions of 644
add_owner_executable_permission() {
    chmod 755 newfile.txt
}

add_dangerously_open_permissions() {
    chmod 777 newfile.txt
}

# Why doesn't macOS Finder display the correct file permissions? It says I only have read and write permissions
# - Finder doesn't show execute permissions at all! I wonder why...
# - At least Finder correctly says owner, group, and world have read and write access, which is true
view_octal_permissions() {
    stat -f "%Lp" newfile.txt # 755 or 777
}

#add_owner_executable_permission
add_dangerously_open_permissions
view_octal_permissions