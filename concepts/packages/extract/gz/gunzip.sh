#!/usr/bin/env bash

# - A file ending with *.gz is a gzipped file. It can be uncompressed/extracted with gunzip 
# - gzip is a compression tool for files only. Use tar to make an archive, then gzip the archive if I want to "gzip a directory" (i.e. "*.tgz")
# - Options
#   - -k: keep the original gzipped file (normally it's removed after the file is extracted)
extract_gzip() {
  gunzip -k /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
}

extract_gzip