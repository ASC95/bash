# - aptitude does not make it easy to install *.deb archives
install_package() {
    # - In Ubuntu, vim is the only vi-like editor installed by default, and vi actually starts vim by default
    #   - In other words, $ vi $ is identical to $ vim $, so I don't actually need to install the vim package
    sudo aptitude install vim
    # This does not work
    #sudo aptitude install /home/austin/programming/tutorials/bash/linux-administration/package-management/view/ubuntu/splunk-8.0.4-767223ac207f-linux-2.6-amd64.deb
}

# Removing a package removes the package contents, but leaves configuration files on the system
uninstall_package() {
    sudo aptitude remove vim
}

# Purging a package removes the package contents and any configuration files
purge_package() {
    sudo aptitude purge vim
}

install_package