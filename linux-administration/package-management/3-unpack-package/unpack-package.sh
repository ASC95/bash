#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# - Command: $ unzip <zip file>
# - Options:
#   - q: make unzip quiet
#   - qq: make unzip really quite
#   - d: extract to the specified directory instead of cwd
# - Notes:
#   - A zip file is a randomly accessible list of individual compressed files that provides no compression across files
unzip_zip_archive() {
    unzip mymatpower.zip
}

# - Command: $ tar -C <output dir> -xf (<*.tar.gz> | 
# - Options:
#   - x: use tar in extraction mode, as opposed to creation mode
#   - f: specify the filename to extract from
#   - C: specify the location to extract the files to
#       - This actually just specifies a directory to cd to after opening the archive but before extracting the entries in the archive
# - Notes:
#   - A tar file stores multiple files in a single file, but provides no compression. Its extension is *.tar.
#   - A "tarball" is a compressed catalog (i.e. a compressed tar file) where the catalog contains files that have been collectively compressed. The
#     entire archive must be decompressed for file access. It is usually compressed with gzip, so its extension is usualy *.tgz or *.tar.gz
#   - Some tar implementations automatically extract both *.tar.gz files and regular *.tar files without special options. Others may require a special
#     flag
extract_tarball() {
    tar -C output -xf mytarball.tgz
}

# - Command: $ tar -czf <output tar file> ()
# - Options:
#   - c: use tar in creation mode
#   - z: compress the tar file with gzip to create a tarball
#   - f: output the tarbal to the file instead of stdout
# - Notes:
#   - This command creates an entirely new tarball. Use different options to append to an existing tarball
create_tarball() {
    tar -czf mytarball.tgz unpack-package.sh hello-world.txt
}

#unzip_zip_archive
extract_tarball
#create_tarball
