- https://en.wikipedia.org/wiki/ - history of Debian Package (dpkg)
- https://en.wikipedia.org/wiki/APT_(software) - history of Advanced Package Tool (APT)
- https://stackoverflow.com/questions/567757/how-do-i-distinguish-between-binary-and-text-files - identifying binary vs. text files
- https://unix.stackexchange.com/questions/374223/installing-apt-get-on-redhat - using apt-get on Red Hat (don't)
# Introduction
- The top-level headings for these notes are based around literal Debian package names instead of the software collections that are distributed by
  those packages because the names of the software collections themselves are conceptually less concrete than their package names
- It seems that all of these commands mentioned here are provided by binaries, but I'm sure there are some that are text files. Collectively, I will
  refer to both types as "command-line utilities" or "utilities"
# The dpkg package
- "dpkg" stands for Debian Package
## Purpose
- dpkg installs a collection of utilities for _run-time_ package management
  - It contains the lowest-level utilities for packing, unpacking, and installing "*.deb" files
## Included command-line utilities
- dpkg enables the folloaptitude versions "?exact-name(octave)"wing commands:
  - `dpkg`: the main front-end for other lower-level utilties that are included in this package
  - `dpkg-deb`: packs and unpackes Debian archives (*.deb files)
  - `dpkg-split`: splits and reassembles large Debian binary package files into smaller parts so that large files can be stored on small media (e.g.
    floppy disks)
  - `dpkg-query`: queries the dpkg database
    - The database is a directory located at "/var/lib/dpkg"
      - It contains information about packages that are installed on the system, but nothing about repositories
  - `dpkg-statoverride`: overrides ownership and mode of files
  - `dpkg-divert`: overrides a package's version of some file(s) within that package via "diversions"
  - `dpkg-trigger`: allows one package to listen for changes in another package during installation and then perform some action(s)
# The apt package
- "apt" stands for Advanced Package Tool
## Purpose
- apt installs a collection of utilities for _run-time_ package management
  - It contains higher-level utilities for managing *.deb files than dpkg
    - Collectively, apt is considered a front-end for dpkg. It invokes utilties in dpkg under the hood
      - `apt` replaced `dselect` as a front-end for dpkg
- Two things apt does that dpkg does not are 1) fetch packages from remote repositories 2) handle dependency resolution
- `apt` is not recommended for scripts because its CLI interface is not stable
  - Use `apt-get` instead
## Included command-line utilities
- apt enables the following commands:
  - `apt`: takes the most important parts of the other utilities in the apt package and presents them through a simplified interface
    - This binary does _not_ have a stable command-line interface and should _not_ be used in scripts
  - `apt-get`: considered to be the back-end for the apt tools in general. It handles packages updates, upgrades, installation, and removal
    - This binary _should_ be used in scripts
  - `apt-cache`: contains commands that exclusively concern the package cache on the system. It has nothing to do with how packages are managed on the
    system itself
  - `apt-config`: provides a programmatic way to interact with the main apt configuration file located at "/etc/apt/apt.conf"
# The aptitude package
## Purpose
- "aptitude" installs the `aptitude` utility which provides even higher-level and more convenient package management than `apt`
  - Unlike `apt`, `aptitude` includes a GUI 
# The dpkg-dev package
- "dpkg-dev" is a separate package entirely from dpkg. It contains _many_ command-line tools to unpack, build, and upload Debian source packages
## Purpose
- It's for building Debian archives, not managing them