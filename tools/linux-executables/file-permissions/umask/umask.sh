#!/usr/bin/env bash

# - https://www.computerhope.com/unix/uumask.htm - basic umask tutorial
# - https://unix.stackexchange.com/questions/84676/how-is-umask-calculated-in-linux - special bit
# - https://stackoverflow.com/questions/10220531/how-to-set-system-wide-umask - modifying system-wide umask on Linux (not macOS)

# - The umask is an octal number (i.e. each digit can have a value of 0-7 inclusive)
#   - The very first digit is a special file permission indicator. It cannot be set at all to any value other than 0 with umask
#   - The last three digits are the permision bits for user, group, and other, respectively
# - In Unix systems, the default permissions value is 666 for a regular file, and 777 for a directory
# - When creating a new file or directory, the kernel takes this default value, "subtracts" the umask value, and gives the new files the resulting
#   permissions
#   - In detail:
#   - 1) The bitwise complement of the umask is taken
#     - The binary representation of 0022 is: 000 000 010 010
#     - The bitwise complement is 111 111 101 101
#   - 2) The bitwise complement is AND-ed to the default permissions value, depending on the file object
#     - The default permissions value for files is 0666
#         ... 110 110 110 
#       & 111 111 101 101 = 000 110 100 100 = 0644
#     - The default permissions value for directories is 0777
#         ... 111 111 111
#       & 111 111 101 101 = 000 111 101 101 = 0755
# - Each Unix-like system has it's own way of establishing a system-wide umask
#   - In Debian, it's stored in /etc/pam.d/common-session
# - Unless a user overrides the default system-wide umask somehow, they will inherit the system-wide umask

# - On Ubuntu, the default umask is 0002, or "u=rwx,g=rwx,o=rx"
#   - Newly created files have permissions of 664
#   - Newly created directories have permissins of 775
# - On MacOS, the defualt umask is 0022, or "u=rwx,g=rx,o=rx"
#   - Newly created files have permissions of 644
#   - Newly created directories have permissions of 755
display_current_umask() {
    umask
    umask -S 
}

# - If I change the umask in the shell, only commands run from that shell environment will have the new umask value. If a new shell is opened, it will
#   have the old umask value.
#set_umask() {
#    umask <something else>
#}

display_current_umask