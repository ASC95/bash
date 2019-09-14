#!/bin/bash

# https://unix.stackexchange.com/questions/20784/how-can-i-resolve-a-hostname-to-an-ip-address-in-a-bash-script - commands for resolving hostname to IP
# https://security.stackexchange.com/questions/13900/if-i-use-a-vpn-who-will-resolve-my-dns-requests - description of DNS and VPN interactions
# https://unix.stackexchange.com/questions/28941/what-dns-servers-am-i-using - strategies for getting DNS information from the OS

# DNS resolution is done by by forwarding all requests to the configured IP of a DNS server. If I'm connected to a VPN, the VPN may or may NOT
# configured the IP address of the DNS to be different from what is normally is. Thus, my ISP may or may not perform DNS resolution while I'm
# connected to a VPN.

# wemc.gridstate.io: 18.210.205.158:443

identify_dns_on_mac() {
    scutil --dns
}

use_host_command() {
    host https://wemc.gridstate.io/
}

identify_dns_on_mac
#use_host_command