#!/usr/bin/env bash

# - https://stackoverflow.com/questions/33075701/how-to-download-directory-file-using-ssh/33075952

# - SCP stands for "Secure Copy Protocol". It is based on SSH, which stands for "Secure Shell" (protocol)

# - It took less than 10 minutes to download an 130 MB folder
#   - Therefore, a 4.5 GB folder should take less than 6 hours ...
download_folder() {
    scp -r ec2-user@pnnl-cribl:/opt/cribl /home/austin/Desktop/files-from-scp/
}