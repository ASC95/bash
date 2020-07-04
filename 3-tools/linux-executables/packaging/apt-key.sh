#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/420961/how-to-identify-gpg-key-ids-so-they-may-be-deleted

# - Each complete output listing from this command is formatted in this way:
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# /etc/apt/trusted.gpg.d/nilarimogard_ubuntu_webupd8.gpg
# ------------------------------------------------------
# pub   rsa1024 2010-01-20 [SC]
#       1DB2 9AFF F6C7 0907 B57A  A31F 531E E72F 4C9D 234C
# uid           [ unknown] Launchpad webupd8
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
show_all_keys() {
    apt-key list
}

# - The list/fingerprint command can take a string that limits which keys are shown
#   - This is Docker's key ID
show_matching_keys() {
    apt-key list 0EBFCD88
}

# - The man page states that a *.gpg file should be placed into /etc/apt/trusted.gpg.d/ and NOT added via the command line as shown here
#   - This command seems to modify /etc/apt/trusted.gpg directly. That's what it did here
add_key_from_stdin() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
}

# - I need the key ID of the public key that I want to remove (see gpg notes)
remove_key() {
    sudo apt-key del 4C9D234C
}

#show_all_keys
show_matching_keys
