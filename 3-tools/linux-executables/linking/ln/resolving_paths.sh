#!/usr/bin/env bash

# - If I use a relative path as the target (i.e. source) for a symlink, ln does not resolve that path relative to the cwd
#   - Always use absolute paths for the target of a symlink!
ln_does_not_resolve_relative_to_cwd() {
    cd ~/programming/repositories/aifbdp-splunk-apps/
    # - This is bad
    ln -s untopchan/ /opt/splunk/etc/apps/untopchan
}

# - For whatever reason, it is an unrecoverable error to end a symlink location with a slash
# - It is okay to end a symlink target with a forward slash
do_not_end_symlink_location_with_slash() {
    cd ~/programming/repositories/aifbdp-splunk-apps/
    # - Syntax error
    #ln -s untopchan/ /opt/splunk/etc/apps/untopchan/
    # - This is fine
    ln -s untopchan /opt/splunk/etc/apps/untopchan
}

# - Tilde expansion works fine since there is nothing special about this context
# - The location of a symlink itself is resolved according to the cwd
correctly_create_symlink() {
    cd /opt/splunk/etc/apps
    ln -s ~/programming/repositories/aifbdps-splunk-apps/untopchan untopchan
}

#ln_does_not_resolve_relative_to_cwd
#do_not_end_symlink_location_with_slash
correctly_create_symlink
