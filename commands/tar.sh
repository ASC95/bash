# http://computing.help.inf.ed.ac.uk/FAQ/whats-tarball-or-how-do-i-unpack-or-create-tgz-or-targz-file - dealing with tarballs
# https://www.pendrivelinux.com/how-to-open-a-tar-file-in-unix-or-linux/ - tar basics
# https://stackoverflow.com/questions/10540935/what-is-the-difference-between-tar-and-zip - tar vs zip

# A tar file stores multiple files in a single file, but provides no compression
# - Extension: *.tar
# A "tarball" is a tar file that has been compressed with gzip. 
# - Extensions: *.tgz or *.tar.gz
# zip is like tar + compression, but it is not the same thing
# - zip: a randomly accessible list of individuall compressed files that provides no compression across files
# - .tgz: a compressed catalog, where the catalog contains files that have been collectively compressed. The entire archive must be decompressed for
#   file access

# The $ tar $ utility can create, add/replace, list, update, or extract
# - The operation must be defined by the first flag
# - Control verbose with -v
# - Specify the path of the tarbal to extract with -f
# - Specify the location to extract to with -C <path>
# - Apparently the -z flag is not necessary to unpack a tarball
extract_tarball_or_tarfile() {
    # This command unpacks the tarball to a directory called Python-3.8.1, located in my Desktop directory
    tar -C "/Users/austinchang/Desktop" -xvf "/Users/austinchang/Downloads/Python-3.8.1.tgz"
}

extract_tarball_or_tarfile