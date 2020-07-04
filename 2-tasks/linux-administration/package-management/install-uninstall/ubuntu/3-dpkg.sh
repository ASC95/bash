#!/usr/bin/env bash

# - dpkg requires sudo to install packages
install_deb_archive() {
    sudo dpkg -i '/home/austin/programming/tutorials/bash/linux-administration/package-management/view/ubuntu/splunk-8.0.4-767223ac207f-linux-2.6-amd64.deb'
}

install_deb_archive