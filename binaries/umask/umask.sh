#!/bin/bash

# https://www.computerhope.com/unix/uumask.htm - basic umask tutorial
# https://unix.stackexchange.com/questions/84676/how-is-umask-calculated-in-linux - special bit
# https://stackoverflow.com/questions/10220531/how-to-set-system-wide-umask - modifying system-wide umask on Linux (not macOS)

# Each Unix-like system has it's own way of establishing a system-wide umask. In Debian, it's stored in /etc/pam.d/common-session. Unless a user
# overrides the default system-wide umask somehow, they will inherit the system-wide umask.

# The default umask for me was 0022. It is an octal number (i.e. each digit can have a value of 0-7 inclusive)
# The last three digits are the permision bits for user, group, and other, respectively.
# - The very first digit is a special file permission indicator. It cannot be set at all to any value other than 0 with umask

# I probably won't want to change the umask value at all, but I need to know how it affects the creation of new files.
# - In short, the umask value is subtracted from the default permissions of the file object and the difference is the permissions of the new object
#   - 777 - 022 = 755 for new directories
#   - 666 - 022 = 644 for new files
# - In detail:
# - 1) The bitwise complement of the umask is taken
#   - The binary representation of 0022 is: 000 000 010 010
#   - The bitwise complement is 111 111 101 101
# - 2) The bitwise complement is AND-ed to the default permissions value, depending on the file object
#   - The default permissions value for files is 0666
#       n/a 110 110 110 
#     & 111 111 101 101 = 000 110 100 100 = 0644
#   - The default permissions value for directories is 0777
#       n/a 111 111 111
#     & 111 111 101 101 = 000 111 101 101 = 0755

display_current_umask() {
    umask # 0022
    umask -S # u=rwx,g=rx,o=rx
}

# If I change the umask in the shell, only commands run from that shell environment will have the new umask value. If a new shell is opened, it will
# have the old umask value.
set_umask() {
    umask <something else>
}

display_current_umask