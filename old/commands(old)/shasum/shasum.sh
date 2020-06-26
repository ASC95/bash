#!/bin/bash

# https://www.softprayog.in/troubleshooting/md5sum-no-properly-formatted-md5-checksum-lines-found

cd "$( dirname "${BASH_SOURCE[0]}" )" # change to current directory

# Running the shasum command on a file will generate a checksum for the file in its current state. The outputted checksum also includes the name of
# the file that was run through the algorithm for convenience
# - The -a option followed by an integer specifies the algorithm (e.g. 1, 224, 256, 384, 512, etc.)
generate_checksum() {
    shasum -a 256 shasum.sh # 94db8e695c96839ba3ea7e97da97322739072fc5350cd75d9312f6870e8b802f  shasum.sh
}

# In order to verify a file against its checksum, I have to use the shasum command (or md5, whatever) with a special checksum file that is formatted
# as follows: <checksum><space><space><file name>
# - The checksum file contains the filename AND the stated correct checksum. The command takes these two arguments and determines whether or not the
#   file in its current state matches the stated correct checksum
# - The output of the shasum command is a string with exactly this format!
verify_checksum() {
    shasum -a 256 -c shasum.sh.sha256
}

#generate_checksum
verify_checksum