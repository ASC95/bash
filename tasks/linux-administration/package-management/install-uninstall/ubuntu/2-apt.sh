# - https://askubuntu.com/questions/624960/what-does-dpkg-warning-while-removing-directory-usr-local-not-empty-so-not-r

# - apt makes it easy to install *.deb archives
install_deb_archive() {
    sudo apt install '/home/austin/programming/tutorials/bash/linux-administration/package-management/view/ubuntu/splunk-8.0.4-767223ac207f-linux-2.6-amd64.deb'
    # This does not work because non-root user cannot access /var/lib/dpkg/lock-frontend
    #apt install '/home/austin/programming/tutorials/bash/linux-administration/package-management/view/ubuntu/splunk-8.0.4-767223ac207f-linux-2.6-amd64.deb'
}

# - This was super hard because I was trying to uninstall Splunk while it was running!
uninstall_previously_installed_deb_archive() {
    # - This did remove some files, but not others. Now I've got a broken package! Actually, technically the package WAS removed correctly. dpkg is
    #   just giving me nice warnings
    #   - dpkg complained that: dpkg: warning: while removing directory <whatever> not empty so not removed
    #   - If I run this command again, nothing happens because apt can't find the "splunk" package
    sudo apt remove splunk 
    # - dpkg does not remove files that were not created by the package it is trying to remove
    #   - E.g. when I run $ dpkg -c ./<splunk deb file>.deb $, I see that the package only contains files in /opt/splunk/bin/, /opt/splunk/etc,
    #     /opt/splunk/lib/, and /opt/splunk/share. If I install and immediately uninstall the splunk package, dpkg still complains about
    #     /opt/splunk/etc/splunk-launch.conf because that file isn't owned by the package (it was created when I installed splunk!)
    #   - I'm guessing dpkg does this to protect the user. Perhaps Splunk does this to protect configuration files?
    # - I cannot run this command because the user "splunk" owns a ton of files in this directory
    rm -rf /opt/splunk
    # - This works. Also make sure Splunk isn't running!
    sudo rm -rf /opt/splunk
}

#install_deb_archive
uninstall_previously_installed_deb_archive
