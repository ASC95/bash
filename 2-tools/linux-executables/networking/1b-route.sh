#!/usr/bin/env bash

# - Just examine the value of the "Gateway" column with associated "Destination" 0.0.0.0
#   - I can literally send an HTTP request to the router's IP as shown there
view_router_lan_ip() {
    route -n
}

view_router_lan_ip