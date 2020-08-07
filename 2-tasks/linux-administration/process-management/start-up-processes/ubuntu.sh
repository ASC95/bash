#!/usr/bin/env bash

# - https://askubuntu.com/questions/795226/how-to-list-all-enabled-services-from-systemctl

# - I really need to study systemctl in detail. It's fine that Docker autostarts for now, but I might disable it later

view_processes_configured_to_start_on_boot() {
    systemctl list-unit-files | grep 'enabled'
}

view_running_processes_managed_by_systemctl() {
    systemctl | grep running
}

start_process_on_boot() {
    sudo systemctl enable docker
}

prevent_process_from_starting_on_boot() {
    sudo systemctl disable docker
}

#view_processes_configured_to_start_on_boot
#view_running_processes_managed_by_systemctl
#start_process_on_boot
prevent_process_from_starting_on_boot