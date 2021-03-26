#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/388542/why-cant-owner-of-folder-write-to-a-folder-created-by-a-different-user - might be helpful?

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Command: $ chmod <code> <directory>
# - Options:
#   - R: recursively change the permissions on all files and directories within the directory
#   - P: if -R is specified, no symbolic links are followed (this is the default)
# - Notes:
#   - The numeric codes for permissions are:
#       - 1: execute
#       - 2: write
#       - 4: read
#   - Default files permissions are 644
#       - Permissions of 755 for a file indicate:
#           - 7: read, write, execute for owner
#           - 5: read and execute for group
#           - 5: read and execute for world
#   - Default directory permissions are 755
#       - Directory permissions explanation:
#           - 1: the user/group/world has permission to access files in the directory
#               - In order to read a file, the user must have execute permissions in all of the directories that contain the file, and must have read
#                 permission on the file itself
#           - 2: the user has permission to create a new file in the directory
#           - 4: the user has permission to view the list of files in the directory
change_directory_permissions() {
    #chmod 700 some-dir
    chmod 755 some-dir
}

view_octal_permissions() {
    stat -f "%Lp" some-dir # 755 or 777
}

#change_directory_permissions
view_octal_permissions