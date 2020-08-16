#!/usr/bin/env bash

# - https://askubuntu.com/questions/117088/aptitude-safe-upgrade-equivalence-with-apt-get - what is $ aptitude safe-upgrade $ ?
# - https://pthree.org/2007/09/24/aptitude-full-upgrade-versus-safe-upgrade/ - safe vs full upgrade
# - https://www.debian.org/doc/manuals/aptitude/ch01s02.en.html#safeUpgrade - official aptitude upgrade documentation

# - Whenever an update command is run, my system queries the package repositories that aptitude is configured to pull from and stores the results of
#   those queries in my system cache. The results of the queries include metadata on new package dependencies, new package versions, etc. After an
#   update has been performed, my system can tell me what I should do to my packages without actually doing anything 
#   - This is equivalent to $ apt-get update
update_aptitude_cache() {
    sudo aptitude update
}

# - For all aptitude actions, the "-s" flag makes aptitude tell me what would happen without actually doing it
#   - In addition, both types of upgrades always prompt me with y/n before doing anything
# - Consider a package, B, that has been marked for upgrading
# - A safe upgrade will "upgrade as many packages as possible without removing existing packages"
#   - Thus, a safe upgrade cannot resolve a situation in which upgrading B would require the REMOVAL of a dependency, C
#       - I ASSUME that a safe-upgrade will upgrade B AND upgrade C if necessary and there are no conflicts
# - A full upgrade will "install and remove packages until all dependencies are satisfied"
#   - Thus, the official documentation makes no promise that a full upgrade WON'T upgrade a dependency of B, C, if modifying C would affect dependents
#     of C, such as D
#       - However, it is a reasonable assumption that a full upgrade won't modify C for the sake of B if it breaks another dependent, D.  
#       - However, what IS possible and described in the second link is a situation where upgrading B requires a new, nonexistent dependency, C_2.
#         Since B can be upgraded and a nonexistent C_2 doesn't break any other packages, B will be upgraded and will probably be unstable because it
#         doesn't have C_2
# - Both types of upgrades will:
#   - Upgrade installed packages
#   - Install new packages to resolve new dependencies
#   - Remove packages if they are unused
# - TLDR: use $ aptitude safe-upgrade $ for every situation except when it fails

safe_upgrade_packages() {
    sudo aptitude safe-upgrade
}

full_upgrade_package() {
    sudo aptitude full-upgrade
}

# Hold vs. keep?

# - Sometimes, I need a package to stay at a certain version no matter what. This is called "holding" a package 
#   - apt uses "pinning" which is somewhat complicated
#   - Instead of pinning, aptitude uses "holding"
hold_package_version() {
    # - Uh-oh! $ vi $ is an executable but is not a package! I can fix this ... actually I can't. No package owns the vi executable! That's becuase #
    #   /usr/bin/vi is a symbolic link! /usr/bin/vi -> /etc/alternatives/vi -> /usr/bin/vim.tiny
    #sudo aptitude hold /usr/bin/vi # No such package /usr/bin/vi
    #dpkg -S /usr/bin/vi # No results
    #dpkg -S vim.tiny # vim-tiny: /usr/bin/vim.tiny
    sudo aptitude hold vim-tiny
}

unhold_package_version() {
    sudo aptitude unhold vi
}

search_for_packages_with_matching_name() {
    aptitude 
}

hold_package_version