#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

count_lines_in_massive_file() {
    wc -l '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv' # 61,284,000
}

count_lines_in_massive_file