#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/28324/how-is-ubuntu-based-on-debian - Ubuntu vs. Debian
# - https://danielmiessler.com/study/fedora_redhat_centos/ - Red Hat vs. Fedora vs. CentOS
# - https://www.quora.com/What-are-the-advantages-of-RHEL-server-over-Ubuntu-server - Ubuntu vs. Red Hat

# - https://linuxconfig.org/how-to-install-packages-on-redhat-8 - introduction to Red Hat package installation
# - https://serverfault.com/questions/811444/how-to-find-out-yum-package-names - view available yum packages
# - https://unix.stackexchange.com/questions/17260/why-use-sudo-yum-install-pkgs-when-i-can-use-yum-install-pkgs - sudo and yum
# - https://unix.stackexchange.com/questions/61283/yum-install-in-user-home-for-non-admins - using yum without sudo is not trivial
# - https://unix.stackexchange.com/questions/252530/how-to-install-man-pages-on-centos - install $ man $ on CentOS (Red Hat)
# - https://unix.stackexchange.com/questions/6263/how-to-check-available-package-versions-in-rpm-systems - view package versions
# - https://snapcraft.io/ - use snap package repository (it's wonderful) instead of rpm/yum repository

# - Redhat is a company that sells the Red Hat Enterprise Linux operating system. This OS is not free, but is professionally supported. It focuses on
#   stability, so new releases are infrequent
#   - Canonical is the company that maintains Ubuntu, which is a free OS that is based on Debian. Ubuntu paired with only the "Main" and/or
#     "Restricted" package repositories is roughly analogous to the Red Hat OS, minus the professional suport. Canonical also offers paid, supported
#     versions of Ubuntu
# - Redhat also sponsors the Fedora OS. Fedora is not professionally supported, but is managed by Redhat. It focuses on new features provided by the
#   community, so new releases are frequent
#   - Ubuntu paired with packages from the "Universe" and/or "Multiverse" package repositories is roughly analogous to Fedora
# - CentOS is a free, community-supported version of Red Hat Enterprise Linux
# - Annecdotally, RHEL is more stable than paid Ubuntu Server

# Debian doesn't neatly fit into this comparison. Debian is a completely free OS that is managed by a team and supported by various commerical
# companies. Debian has three branches: stable, testing, and unstable. Each version of this branch gets a cool nickname (e.g. the current stable
# branch is called "buster") Ubuntu is based off of Debian (see first source for the exact relationship). Basically, Ubuntu gets Debian packages and
# adds on more of its own packages

# The core package manager for RHEL is rpm. rpm cannot manage dependencies for package installations, so it is useless for installing packages outside
# of a kernel context. yum is a front-end for rpm. yum installs dependencies for when installing a package. dnf is the newer, more performant version
# of yum. dnf is available as of Red Hat 8 and Fedora 22

# Often, I need to run $ yum $ with $ sudo $

# Packages I commonly need:
# - Octave: $ yum install octave

# - Command:
#   - $ yum list all
#   - $ yum list installed 
# - Arguments:
#   - all: show all available and installed packages
#   - installed: show installed packages 
# - Options:
#   - show-duplicates: don't restrict yum to only showing the latest versions of all packages (very verbose)
# - Notes:
#   - There are a lot of options for this command
view_available_packages() {
    yum list all
}

# - Command: $ yum search <package>
# - Options:
#   - show-duplicates: don't restrict yum to only showing the latest versions of matching packages (very useful)
# - Notes:
#   - This command is like $ yum list $, but it tries to match whatever <package> string was provided
search_available_packages() {
    yum search octave
}

# - Command: $ yum info <package>
# - Options:
#   - show-duplicates: don't restrict yum to only showing the info for the latest version of the package (very useful)
# - Notes:
#   - Use this command with --show-duplicates to view package versions
view_package_information() {
    yum info octave
}

# - Command: $ yum ? <package>
# - Options:
# - Notes:
upgrade_package() {
    echo hi
}

# - Command: $ yum remove <package>
# - Options:
# - Notes:
uninstall_package() {
    yum remove octave
}

# See source
get_snap_packages() {
    echo hi
}