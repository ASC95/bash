#!/usr/bin/env bash

# https://www.cyberciti.biz/faq/how-to-use-chmod-and-chown-command/ - how to use chown and chmod
# https://linuxize.com/post/how-to-list-groups-in-linux/ - show groups
# https://linuxize.com/post/how-to-list-users-in-linux/ - show users

# - Command:
#   - $ chown <owner-user> <file>
#   - $ chown <owner-user>:<owner-group> <file>
#   - $ chown <owner-user>:<owner-group> <directory>
#   - $ chown [options] <owner-user>:<owner-group> <file>
# - Options:
#   - R: change ownership recursively
# - Notes:
#   - $ chown $ changes the owner of a file
#   - I cannot use chown to set nonexistent users or groups
change_directory_owner() {
    chown 
}

# - Command: $ groups [<user>]
# - Options:
#   - [user]: show the groups that [<user>] belongs to, as opposed to the groups that the currently logged-in user belongs to
# - Notes:
#   - $ groups $ only shows the groups that the currently logged-in user belongs to
#       - The first group in the list is the primary group (the group that manages file access)
#   - The "wheel" group by convention allows all members of that group to access administrator privileges
show_available_groups() {
    groups austinchang  # staff everyone localaccounts _appserverusr admin _appserveradm _lpadmin _appstore _lpoperator _developer _analyticsusers com.apple.access_ftp com.apple.access_screensharing com.apple.access_ssh com.apple.sharepoint.group.1
    #groups root        # wheel daemon kmem sys tty operator procview procmod everyone staff certusers localaccounts admin _appstore _lpadmin _lpoperator _developer _analyticsusers com.apple.access_ftp com.apple.access_screensharing com.apple.access_ssh com.apple.sharepoint.group.1
}

# - Command: $ cat /etc/passwd
# - Options:
# - Notes:
#   - This should show all users, but with macOS Open Directory is also involved
show_available_users() {
    cat /etc/passwd
}

#show_available_groups
show_available_users