#!/usr/bin/env bash

# - https://askubuntu.com/questions/652326/whats-a-virtual-package
# - https://askubuntu.com/questions/679137/how-to-check-if-a-virtual-package-is-installed

# - I can inspect a virtual package to see what real packages implement the functionality defined by the virutal package. Then, I can see if any of
#   those real packages are installed
#   - A virtual package name is simply a generic label for a set of functionality that can be implemented by one or more real packages
inspect_virtual_package() {
    apt-cache showpkg libsbml-octave
    printf '~~~~\n'
    aptitude show libsbml5-octave
}

inspect_virtual_package