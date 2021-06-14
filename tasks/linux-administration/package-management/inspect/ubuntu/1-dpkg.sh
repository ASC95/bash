#!/usr/bin/env bash

# - https://www.cyberciti.biz/howto/question/linux/dpkg-cheat-sheet.php

cd "$( dirname "${BASH_SOURCE[0]}")" && pwd

# - See apt for listing all packages installed on the system
view_files_installed_by_a_package() {
    #dpkg -L zoom
    dpkg -L vim-common
}

# - This metadata is different from the metadata provided by $ apt show
#   - I wonder why it won't display information about "splunk". The only reason I can think of is that splunk didn't come from a repository
#       - This is also true for "teams"
#       - Note that dpkg -s [splunk|teams] works fine
# - If this isn't working use $ apt show <package> $ instead, which is really $ apt-cache show <package> $ under the hood
view_metadata_about_package() {
    #dpkg -p apt
    #dpkg -p vim-common
    dpkg -p splunk
}

# - This is very useful for learning where the files in an uninstalled *.deb package WILL go in my system
view_files_inside_of_deb_package() {
    dpkg -c splunk-8.0.4-767223ac207f-linux-2.6-amd64.deb
}

# - Strictly speaking, this uses dpkg-query to perform a CASE-SENSITIVE search all packages that own files corresponding to the provided wildcard
#   pattern
#   - The output will be lines of "<package>: <filepath>"" matches
#       - E.g. One line of output from the first command below is "linux-headers-5.4.0-33: /usr/src/linux-headers-5.4.0-33/scripts/gdb/linux/genpd.py"
#   - Use absolute paths for fewer results
view_which_package_owns_file() {
    #dpkg -S gdb # This returns a ton of ouput
    dpkg -S /usr/bin/gdb # This returns a single line!
    #dpkg -S splunk
}

find_out_if_package_is_installed_or_not() {
    #dpkg -s vim-common | grep -i "status" # vim-common is installed
    dpkg -s splunk # Now splunk is installed!
}

# This shows me that the name of this package is "splunk"
view_metadata_about_deb_archive() {
    dpkg --info splunk-8.0.4-767223ac207f-linux-2.6-amd64.deb
}

#view_files_installed_by_a_package
view_metadata_about_package
#view_files_inside_of_deb_package
#view_which_package_owns_file
#find_out_if_package_is_installed_or_not
#view_metadata_about_deb_archive
