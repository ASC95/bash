#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/47434/what-is-the-difference-between-curl-and-wget - curl vs. wget
# - https://github.com/curl/curl/issues/4689 - curl content-length error solution
# - https://www.pair.com/support/kb/paircloud-downloading-files-with-curl/ - download files with curl

# $ curl
#   - Built for exchanging requests + respones with a server. Can communicate over HTTP/HTTPS, FTP, SMTP, and many more protocols
#   - Exists on more systems by default then $ wget $
#   - Is based on a library called "libcurl"
#   - Is faster and has a smaller file size than wget
# - $ wget
#   - Solely downloads files from HTTP/HTTPS or FTP
#   - Is a standalone tool

# Sometimes, I package that I need isn't available in a Linux package repository. In that case, I need to download the package myself. $ curl $ seems
# to be the superior tool

# - Command: $ curl <URL>
# - Options:
#   - A: set the user agent
#   - s: make curl silent
#   - v: make curl verbose
#   - o: write the output to a file instead of stdout
#   - http1.0: use HTTP/1.0 instead of HTTP/1.1
#   - http1.1: use HTTP/1.1 instead of HTTP/2
# - Notes:
#   - http1.1 has fixed the "curl(92)"" content-length error before
#   - The default HTTP protocol version used depends on the curl installation
download_and_save_file_with_curl() {
    curl --http1.1 -o 'mymatpower.zip' 'https://matpower.org/dld/1244/'
}

# - Command: $ wget <URL>
# - Options:
#   - O: write to the specified filename
#   - q: make wget silent
#   - v: make wget verbose
#   - nv: make wget quiet (still displays errors)
# - Notes:
#   - Sometimes curl is annoying while wget will just work!
download_and_save_file_with_wget() {
    wget -O 'mymatpower.zip' 'https://matpower.org/dld/1244/'
}