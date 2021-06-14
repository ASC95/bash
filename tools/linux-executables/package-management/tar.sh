#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/23744/how-do-i-extract-with-tar-to-a-different-directory - explains the -C option


# http://computing.help.inf.ed.ac.uk/FAQ/whats-tarball-or-how-do-i-unpack-or-create-tgz-or-targz-file - dealing with tarballs
# https://www.pendrivelinux.com/how-to-open-a-tar-file-in-unix-or-linux/ - tar basics
# https://stackoverflow.com/questions/10540935/what-is-the-difference-between-tar-and-zip - tar vs zip

# The $ tar $ utility can create, add/replace, list, update, or extract
# - The operation must be defined by the first flag
# - Control verbose with -v
# - Specify the path of the tarbal to extract with -f
# - Specify the location to extract to with -C <path>
# - Apparently the -z flag is not necessary to unpack a tarball
extract_tarball_or_tarfile() {
    # This command unpacks the tarball to a directory called Python-3.8.1, located in my Desktop directory
    tar -C "/Users/austinchang/Desktop" -xvf "/Users/austinchang/Downloads/Python-3.8.1.tgz"
}


# - -C <dir>: change to the directory before starting (this option is tricky, see source and man page)
# - -c <file> [, <file>...]: create a tarball using the provided files/directories
# - -f <filename>: use <filename> as the name of the tarball
# - -v: run tar in verbose mode
# - -z: filter the archive through gzip
create_gzipped_tarball() {
  tar -C '/home/austin/programming/tutorials/splunk/1-concepts/2-secondary' -f 'kvstore-notes.tgz' -cvz 'kvstore'
}

#extract_tarball_or_tarfile
create_gzipped_tarball
