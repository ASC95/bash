# http://mywiki.wooledge.org/BashGuide/InputAndOutput

cd $(dirname "${BASH_SOURCE[0]}")

# Cat expects the name of a file. When cat gets the name of the file, it opens a new FD to the file and reads the contents through the FD.
open_new_fd() {
    cat 'get-absolute-script-dir.sh'
}

# $ cat $ will read from stdin if the name of a file is not provided to it. Typically, a shell is configured so that stdin comes from a keyboard. We
# can change the stdin of $ cat $ to come from a particular file instead.
use_redirected_stdin() {
    #cat < 'get-absolute-script-dir.sh'
    cat 0< 'get-absolute-script-dir.sh' # Alternative syntax
}

#open_new_fd
use_redirected_stdin