#!/usr/bin/env bash

# https://wiki.octave.org/Octave_for_Red_Hat_Linux_systems - couldn't do this
# https://snapcraft.io/install/octave/rhel#install - there is hope after all

# This file needs to be copied into another repository eventually

# Steps:
# 1) Create octave/ and assoicated directories in /usr/local/
# 2) Use git to clone the desired Octave repository
# 3) Check out the desired version of Octave via git tags
# 4) Bootstrap the build system: $ ./bootstrap
#   - The easiest way to run this command is by being on the latest master branch commit, but the command failed!
# 5) Cry
# 6) Stop crying
# 7) Delete everything up to this point
# 8) Follow the instructions in the second link
# 9) Success!