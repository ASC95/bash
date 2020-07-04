#!/usr/bin/env bash

# - This shows all of the APT directives that are merged to determine the configuration of the APT suite of tools
show_apt_configuration() {
    apt-config dump
}

show_apt_configuration