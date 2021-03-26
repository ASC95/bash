#!/usr/bin/env

cd '/etc/apt/trusted.gpg.d/'

# - The keyid is the last 8 characters of the gpg key's fingerprint
#   - In this case, that's 4C9D234C
show_gpg_file_contents() {
    gpg 'nilarimogard_ubuntu_webupd8.gpg'
}

show_gpg_file_contents