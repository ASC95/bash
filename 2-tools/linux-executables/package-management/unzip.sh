#!/usr/bin/env

cd "$(dirname "${BASH_SOURCE[0]}")"

# - The -n flag ensures that existing files will never be overwritten
unzip_zip_archive_without_overwriting_existing_files() {
    unzip -n 'matpower7.0.zip'
}

# - -d <dir>: extract to the specified directory
#   - This way I can avoid the annoying prompt about whether to overwrite the zip archive itself with its inflated contents
unzip_huge_annoying_archive() {
    unzip -d foo "${HOME}/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/"
}

#unzip_zip_archive_without_overwriting_existing_files
unzip_huge_annoying_archive