#!/usr/bin/env

cd "$(dirname "${BASH_SOURCE[0]}")"

# The -n flag protects me from making any mistakes
unzip_zip_archive_without_overwriting_existing_files() {
    unzip -n 'matpower7.0.zip'
}

unzip_zip_archive_without_overwriting_existing_files