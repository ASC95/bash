# https://www.makeuseof.com/tag/chmod-command-linux-file-permissions/

# http://linuxcommand.org/lc3_lts0090.php

# Use ls -a to view the permissions of a file
# By default a file appears to have -rw-r--r-- permissions which is equivalent to 644
ls -l
# 755 is equivalent to -rwxr-xr-x
chmod 755 permissions.sh
ls -l
chmod 644 permissions.sh