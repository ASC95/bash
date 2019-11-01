#!/bin/bash

#docker run -it \
#--mount type=bind,src="/Users/austinchang/tutorials/bash/binaries/ln",\
#dst=/home/bm \
#debian:stable

create_hard_link() {
    ln ./some-dir/realfile.txt my-hard-link
}

# A hard link (by default) cannot be created if it would replace another existing hard link
overwrite_with_hard_link() {
    ln some-dir/realfile.txt realfile2.txt
}

create_symbolic_link() {
    ln -s ./some-dir/realfile.txt my-soft-link
}

# A symbolic link (by default) cannot be created if it would replace an existing hard link
overwrite_with_symbolic_link() {
    ln -s some-dir/realfile.txt realfile2.txt
}

#create_hard_link
overwrite_with_hard_link
#create_symbolic_link
#overwrite_with_symbolic_link