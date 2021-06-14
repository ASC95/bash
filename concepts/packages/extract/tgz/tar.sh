#!/usr/bin/env bash

# - The tar executable can create and extract tar files
#   - A tarfile is a bunch of files combined into a single file
#   - Since tarfiles are usually compressed with gzip, the tar executable can natively deal with gzipped tarfiles
# - Options
#   - -C <dir>: change to the specified directory before doing anything else. This flag affects all subsequent flags that follow
#   - -x: use tar in extraction mode
#   - -f <filename>: I pretty much always need this option. If it isn't used, tar will assume it's supposed to work with some kind of default built-in
#     archive
extract_gzipped_tarfile() {
  # - These options extract the tarfile into a directory with no stdout. The tarfile is kept alongside the directory
  tar -C /home/austin/Downloads -xf alert-manager_307.tgz
}