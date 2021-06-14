#!/usr/bin/env bash

# - Commands: $ crontab -l
# - Options:
#   - l: show the crontab file
#       - If the -u flag isn't used, this will always show the crontab file of the current user
#       - E.g. if I'm logged in as root, it will show me the crontab file for root
#       - E.g. if I'm logged in as austinchang, it will show me the crontab file for austinchan
# - Notes:
view_my_crontab_file() {
    crontab -l
}

# - Commands: $ crontab -u <user> -l
# - Options:
#   - u: perform the subsequent action for the specified user
#       - Must be root to use the -u flag
#   - l: show the crontab file
# - Notes:
view_another_users_crontab_file() {
    # sudo su
    crontab -u austinchang -l
}

# - Commands: $ crontab <file>
# - Options:
# - Notes:
#   - All this command does is write whatever cron jobs are defined in <file> to /private/var/at/tabs/<username>, provided that the syntax in <file>
#     is valid
load_cron_jobs_from_file() {
    crontab file-with-cron-jobs.txt
}

edit_crontab_file() {
    crontab -e
}

remove_crontab_file() {
    crontab -u
}

#view_my_crontab_file
#view_another_users_crontab_file
#load_cron_jobs_from_file
edit_crontab_file
#remove_crontab_file
