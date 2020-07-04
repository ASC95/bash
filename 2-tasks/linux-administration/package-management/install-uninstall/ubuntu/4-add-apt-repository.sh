#!/usr/bin/env bash

# - https://askubuntu.com/questions/148932/how-can-i-get-a-list-of-all-repositories-and-ppas-from-the-command-line-into-an

# - This isn't super clean, but it is what it is
# - To list just PPAs, modify grep!
show_all_apt_repositories() {
    grep -P '^(?!#)' /etc/apt/sources.list /etc/apt/sources.list.d/*
}

# - It's nice that add-apt-repository automagically downloads the public key of the repository/PPA that I want to add, then verifies the
#   repository/ppa is valid before adding it to my apt-cache or whatever, but how do I know which keyserver is being contacted?
show_default_gpg_keyserver() {
    #TODO
    echo ''
}

# - This will make my system automatically fetch the public key of the PPA/repository, verify the PPA/repository, then add it to apt-cache or whatever
quickly_add_repository() {
    sudo add-apt-repository ppa:nilarimogard/webupd8
    # This is just another example
    #sudo add-apt-repository \
    #"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    #$(lsb_release -cs) \
    #stable"
}

# - Performing this command makes a *.save file for every *.list file for whatever reason. These *.save files didn't exist before I ran this command
#   - I tried using this ppa to install woeusb, but it didn't work
remove_repository() {
    sudo add-apt-repository -r ppa:nilarimogard/webupd8
    # After I remove the repository, I can optionally stop trusting the key
    #sudo apt-key del 73C62A1B
}

# - This command adds Docker's public repository key
#   - The "-" option makes apt-key accept the key from stdin
manually_add_repository_public_key() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
}

# - By manually add repository, I'm asking if there's a different workflow to adding a repository when the key is manually added. It doesn't appear
#   that there is necessarily a different workflow
manually_add_repository() {
    #TODO
    echo ''
}

show_all_apt_repositories
#quickly_add_repository