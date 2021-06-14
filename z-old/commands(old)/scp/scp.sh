#!/bin/bash

# https://www.maketecheasier.com/scp-vs-sftp/
# https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/

# SCP (secure copy protocol) is one alternative to the old, insecure FTP. $ scp $ is non-interactive. Therefore, commands can't be read from scripts;
# they must be typed into the command line???
# - scp relies on ssh, so if ssh isn't set up then scp won't work
#   - SFTP is an entirely different replacement for FTP that also relies on ssh. 
# - scp will overwrite a file with the same name on the remote host without warning, so use it with caution!